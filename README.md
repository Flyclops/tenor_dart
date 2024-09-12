# Tenor Dart

<p align="center">
  <a href="https://pub.dartlang.org/packages/tenor_dart"><img src="https://img.shields.io/pub/v/tenor_dart.svg" alt="Tenor Dart Pub Package" /></a>
  <a href="https://opensource.org/license/bsd-3-clause"><img src="https://img.shields.io/badge/License-BSD_3--Clause-blue.svg" alt="License BSD 3-Clause" /></a>
  <a href="https://github.com/flyclops/tenor_dart/stargazers"><img src="https://img.shields.io/github/stars/flyclops/tenor_dart?style=flat" alt="Tenor Dart Issues" /></a>
  <a href="https://github.com/flyclops/tenor_dart/issues"><img src="https://img.shields.io/github/issues/flyclops/tenor_dart" alt="Tenor Dart Issues" /></a>
</p>

This package integrates [Tenor GIF search](httpsku://tenor.com/) into [Dart](https://dart.dev/) by utilizing the [http](https://pub.dev/packages/http) package to communicate directly with the Tenor API V2.

Currently supported endpoints include: [search](https://developers.google.com/tenor/guides/endpoints#search), [featured](https://developers.google.com/tenor/guides/endpoints#featured), [categories](https://developers.google.com/tenor/guides/endpoints#categories), [search suggestions](https://developers.google.com/tenor/guides/endpoints#search-suggestions), [autocomplete](https://developers.google.com/tenor/guides/endpoints#autocomplete), [trending search terms](https://developers.google.com/tenor/guides/endpoints#trending-search), [register share](https://developers.google.com/tenor/guides/endpoints#register-share) and [posts](https://developers.google.com/tenor/guides/endpoints#posts).

<p align="center"><img src="https://github.com/flyclops/tenor_dart/raw/main/example/assets/demo.gif" width="200" alt="Tenor Dart Demo"/></p>

<p align="center"><strong><sup>Show some ❤️ and <a href="https://github.com/flyclops/tenor_dart">star the repo</a> to support this package.</sup></strong></p>

## What to know
- In order to start using Tenor Dart you must obtain an API key by registering your project with [Tenor](https://developers.google.com/tenor/guides/quickstart).
- Tenor requires proper [attribution](https://developers.google.com/tenor/guides/attribution) for projects using their API. This package does not handle the attribution process, so you will need to take care of it yourself.

## Obtaining Tenor API v2 key
1. Log in to the [Google Cloud Console](https://console.cloud.google.com)
2. Create a [new project](https://console.cloud.google.com/projectcreate)
3. Go to the Google Cloud Marketplace and find the [Tenor API](https://console.cloud.google.com/marketplace/product/google/tenor.googleapis.com)
4. Click `Enable` to activate it
5. In the navigation menu, go to the `APIs & Services` tab and select [Credentials](https://console.cloud.google.com/apis/credentials)
6. Click `+ Create Credentials` and choose `API key`
7. Copy the generated API key
8. Provide this API key as a parameter to `TenorClient`

## Usage

### Installation

```
dart pub add tenor_dart
```
 <sup>Having trouble? Read the pub.dev <a href="https://pub.dev/packages/tenor_dart/install">installation page</a>.</sup>

### Import

Import the package into the dart file where it will be used:

```
import 'package:tenor_dart/tenor_dart.dart';
```

### Initialize

You must pass in a valid `apiKey` provided by [Tenor](https://developers.google.com/tenor/guides/quickstart). It's **strongly recommended** to also pass in a `clientKey` as this will help you distinguish which project is making the requests.

```
var tenorClient = Tenor(apiKey: 'YOUR_API_KEY', clientKey: 'YOUR_PROJECT_NAME');
```

## Example

Here is how you can get 20 of the latest [featured](https://developers.google.com/tenor/guides/endpoints#featured) GIFs and print the first one.

```
var tenorClient = Tenor(apiKey: 'YOUR_API_KEY', clientKey: 'YOUR_PROJECT_NAME');
final TenorResponse? response = await tenorClient.featured(limit: 20);
final List<TenorResult>? gifs = response?.results;
print(gifs?.first.media.tinygif?.url);
```

## Looking for a UI?

If you're seeking a ready-made UI solution, check out [Tenor Flutter](https://pub.dartlang.org/packages/tenor_flutter), which is designed based on the [Tenor SDK](https://developers.google.com/tenor/guides/quickstart#launch-search) [guidelines](https://developers.google.com/tenor/guides/attribution).

## What's next?

- Documentation
- Tests
- Further improvements
