module Pretty where

import Language.Haskell.Exts.Annotated


prettyHS :: String -> String
prettyHS src
  = case parseFileContentsWithComments defaultParseMode src of
        ParseOk (ast, _) -> prettyPrint ast
        _ -> src


prettyHSFile :: FilePath -> IO String
prettyHSFile file
  = do pr <- parseFileWithComments defaultParseMode file
       case pr of
           ParseOk (ast, comments) -> return $ exactPrint ast comments
           _ -> readFile file
