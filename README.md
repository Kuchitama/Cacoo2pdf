# Cacoo2pdf

This gem generates pdf from cacoo diagram's iamge.


## Motivation

In Linux, we can't use Cacoo ninja.
So we can't get pdf with font data on the cacoo server.

## Installation

1.download gem file from GitHubRelease

2.install gem
```
gem install cacoo2pdf-0.1.0.gem
```

## Usage

```sh
cacoo2pdf -n pdf_name -d xxxxxxxxxxxxxxxx [-k xxxxxxxxxxxxxxxxxxxx] [-o output_dirctory_path]
```

### Options

| option | require | description |
|:------;|:-------:|:------------|
| -n, --name | true | output pdf filename |
| -d, --diagram | true | cacoo diagram id |
| -k, --api_key | false | cacoo api key. This can specify as environment value `CACOO_API_KEY` |
| - o, --output | false | output directory path to generate pdf. |

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Kuchitama/cacoo2pdf.

