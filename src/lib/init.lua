-- Wrapper to load child MainModule incase you're using Rojo | Does not implement a cache, unlike the `id` based loader
return require(require(script.MainModule));
