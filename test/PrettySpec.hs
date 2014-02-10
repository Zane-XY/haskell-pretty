module PrettySpec (main, spec) where

import Test.Hspec
import Pretty

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "someFunction" $ do
    it "should work fine" $ do
      putStrLn $ codeFormat "module X where x = 1 where { y 1 = 2; y _ = 2  } --x"
      content <- srcFileFormat "src/Pretty.hs"
      putStrLn content
