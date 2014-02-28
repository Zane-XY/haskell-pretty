module PrettySpec (main, spec) where

import Test.Hspec
import Pretty

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "someFunction" $
    it "should work fine" $ do
      putStrLn (prettyHS " module X       where x = 1 where { y 1 = 2; y _ = 2  } --x")
      content <- prettyHSFile "test/PrettySpec.hs"
      putStrLn content
