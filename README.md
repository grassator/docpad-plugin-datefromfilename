# Date from Filename Plugin for DocPad
This plugin provides support for [DocPad](https://docpad.org) for specifying
document dates at the beginning of their filenames.

## Install

```
npm install --save docpad-plugin-datefromfilename
```

## Usage

To use, simply prepend document file name with date formatted like `YYYY-MM-DD`
separated from base name with either nothing, space, `-` or `_`. In the end
basename (without extension) of your file should look something like this:

```
2013-03-10_my-awesome-page
```

## Configuration

By default, this plugin does not remove date part from output filename. This can be changed in your [DocPad configuration file](http://docpad.org/docs/config) by adding something similar to the following:

``` coffee
plugins:
	datefromfilename:
		removeDate: true
```

You can customize the regular expression used to parse dates from filenames with `dateRegExp`:

```coffee
plugins:
  datefromfilename:
    dateRegExp: /\b(\d{4})-(\d{2})-(\d{2})-/
```

## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)