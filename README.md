# pretty-hs

very basic haskell source code pretty printer using [Language.Haskell.Exts.Pretty](http://hackage.haskell.org/package/haskell-src-exts-1.14.0.1/docs/Language-Haskell-Exts-Pretty.html#v:prettyPrint)


## Installation

clone and run

```
cabal install

```
this should install the pretty-hs exebutable into your ~/.cabal/bin/, make sure it's in your path.

## Usage

add this into your `.vimrc`

```
au BufEnter *.hs setl formatprg=pretty-hs\ --stdin\ --stdout

```
and use `gq` to format a block of selected codes, if the source can't be parsed, it'll return the original source.

## formatter demo

visual select the following code

```
prettyHS ::             String     ->          String
prettyHS src = case parseFileContentsWithComments defaultParseMode src of
        ParseOk (ast, _)          -> prettyPrint ast
        _ ->       src

```
format with `gq`, you'll get:

```
prettyHS :: String -> String
prettyHS src
  = case parseFileContentsWithComments defaultParseMode src of
        ParseOk (ast, _) -> prettyPrint ast
        _ -> src

```

## Limitation

the `Language.Haskell.Exts` doesn't provide parameterized formatter, so it's not configurable. 
And the comments is discarded in the `prettyPrint` function, so this formatter is just used for formatting code fragments.