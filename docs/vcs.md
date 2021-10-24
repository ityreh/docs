# Version Control System

## Conventional Commits

[Source](https://www.conventionalcommits.org/en/v1.0.0/)

Format: `<type>[(scope)][!]: <description>`

- **Scopes** are optional and can be any keyword.
- Use the optional **!** to mark breaking changes.

### Types

|Type    |When to use                                                                                                |
|--------|-----------------------------------------------------------------------------------------------------------|
|build   |Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)        |
|chore   |Changes that do not modify src or test files                                                               |
|ci      |Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)|
|docs    |Documentation only changes                                                                                 |
|feat    |A new feature                                                                                              |
|fix     |A bug fix                                                                                                  |
|perf    |A code change that improves performance                                                                    |
|refactor|A code change that neither fixes a bug nor adds a feature                                                  |
|style   |Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)     |
|test    |Adding missing tests or correcting existing tests                                                          |
