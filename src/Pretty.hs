module Pretty where

import Language.Haskell.Exts.Annotated

prettyHS :: String -> String
prettyHS codeFrag =
  case parseFileContentsWithComments defaultParseMode codeFrag of
    ParseOk (ast, comments) -> exactPrint ast comments
    _ -> "not ok"

prettyHSFile :: FilePath -> IO String
prettyHSFile file = do
  pr <- parseFileWithComments defaultParseMode file
  case pr of
    ParseOk (ast, comments) -> return $ exactPrint ast comments
    _ -> readFile file
