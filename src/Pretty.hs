module Pretty where

import Language.Haskell.Exts.Annotated.ExactPrint
import Language.Haskell.Exts.Annotated
import System.IO

-- main :: IO ()
-- main = interact codeFormat

srcFileFormat :: FilePath -> IO String
srcFileFormat file = do
  pr <- parseFileWithComments defaultParseMode file
  case pr of
    ParseOk (ast, comments) -> return $ exactPrint ast comments
    _ -> readFile file

codeFormat :: String -> String
codeFormat src = case  parseFileContentsWithComments defaultParseMode src of
  ParseOk (ast, comments) -> exactPrint ast comments
  ParseFailed loc err -> src
