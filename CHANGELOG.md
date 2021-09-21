## 1.1.1 - Saturday, Sep. 18, 2021
- feat: added string methods
- feat: added number methods
- feat: added date methods
- feat: added on flutter widgets
- feat: added on flutter material

## 1.1.0 - Saturday, Sep. 18, 2021
- fix: normalized library export files
- feat: added github actions pull request validation flow

**BREAKING CHANGES**
- feat: Changed some extension methods into getters
  - orEmpty() => orEmpty;
  - orZero() => orZero;
  - toIntOrNull() => tryToInt();
  - toDoubleOrNull() => tryToDouble();

## 1.0.1

Rename files. It's a breaking change, need to update the imports. 

## 1.0.0

The first release adds the folowing String extension functions:
* `orEmpty`
* `toInt`
* `toIntOrNull`
* `toDouble`
* `toDoubleOrNull`
* `orZero`
