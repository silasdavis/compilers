lllc-server
===========

The Lovely Little Language Compiler: A web server and client for compiling ethereum languages.

# Features

- language agnostic (currently supports lll, serpent; solidity coming soon)
- handles included files recursively with regex matching
- client side and server side caching
- configuration file with per-language options
- local proxy server for compiling from languages other than go

Eris Industries' own public facing LLLC-server (at http://lllc.erisindustries.com) is hardcoded into the source,
so you can start compiling ethereum language right out of the box with no extra tools required.

If you want to use your own server, or default to compiling locally, or otherwise adjust configuration settings,
see the config file at `~/.decerver/languages/config.json`.

# How to play

## Use the Golang API

```
bytecode, err := lllcserver.Compile("mycontract.lll")
```

Language type determined automatically from extension.

## Use the CLI

### Compile Remotely

```
lllc-server compile --host http://lllc.erisindustries.com:8090 test.lll 
```

Leave out the `--host` flag to default to the url in the config.

### Compile Locally 
Make sure you have the appropriate compiler installed and configured (you may need to adjust the `cmd` field in the config file)

```
lllc-server compile --local test.lll
```

### Run a server yourself

```
lllc-server --port 9000
```

## Use the json-rpc proxy server

If you are coding in another language and would like to use the lllc-server client without wrapping the command line, run a proxy server and send it a simple http-json request.

To run the proxy:

```
lllc-server proxy --port 9000
```

And the JSON request:

```
{
 source:"myfile.se"
}
```

Or, to compile literals:

```
{
 source: "x=5",
 literal: true,
 language: "se"
}
```

The response JSON looks like:

```
{
 bytecode:"600580600b60003960105660056020525b6000f3",
 error:""
}
```


# Support

Run `lllc-server --help` or `lllc-server compile --help` for more info, or come talk to us on irc at #erisindustries and #erisindustries-dev.
