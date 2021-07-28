# J3Util

A Roblox Utility Library

## Loader

The custom loader (`require(7162009730)` - source found in `src/loader`) checks for a cached J3Util version, and loads it if found, otherwise it loads the actual main module and moves it to `ReplicatedStorage.ModuleCache`(`.J3Util`).

## Rojo

Using Rojo for this library is slightly discouraged.

This project's Rojo version is mainly for if you're running a fork of it, and for me when testing.
To actually use this library, I strongly suggest using `require(7162009730)` instead.
Autocomplete is fucked anyway, so it's not really helpful to use rojo for this project (you can still use `require(7162009730)` in an existing rojo project - i am not saying don't use rojo, but rather, don't put this in your codebase)

### but it is possible

run `git submodule add git@github.com:0J3/J3Util.git` wherever you want this repo to be in your codebase

from there, just require it's main modulescript (**NOT** any of its many nested ones - those aren't intended for direct calling)

## Specific API Version

To get a Specific API Version running, place a folder named `J3Util` in the `ServerScriptService` service, containing a MainModule, which should contain the J3Util API Implementation at that specific version.

From there, **use `require(7162009730)`** to load J3Util, or use **`require(require(game:GetService('J3Util'):FindFirstChild('MainModule')))`**

## Running on the client

(Requires usage of the loader - `require(7162009730)` - being run on the **Server**) Once loaded on the server, use **`require(game:GetService('ReplicatedStorage'):WaitForChild('ModuleCache'):WaitForChild('J3Util'))`** to load it (from the Custom Module Cache)
