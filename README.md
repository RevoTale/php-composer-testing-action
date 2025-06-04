# php-composer-testing-action

GitHub CI Action to simplify the process of testing composer packages for PHP.

## Features

- Easily test your PHP Composer packages in GitHub Actions.
- Supports multiple PHP versions.
- Forces testing with prefer-lowest or stable.
- PHP and Composer is auto configured
- Use of CI cache to reduce your GitHub CI execution time

## Usage

Add the following to your `.github/workflows/test.yml`:

```yaml
name: Run Composer Tests

on:
  push:
    branches: [ main ]
  pull_request:

jobs:
  test:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        php: [ '8.4', '8.2', '8.0' ]
        prefer-lowest: [1,0]
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Run Composer Testing Action
        uses: RevoTale/php-composer-testing-action@v1
        with:
          php-version: ${{ matrix.php }}
          prefer-lowest: ${{ matrix.prefer-lowest }}
```
[MIT Licence](./LICENCE)
