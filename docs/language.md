# Best practices for some programming languages

This article is about best practices and usefull hints that are specific to a programming language.

## Python

TODO:

- virtualenv, virtualenvwrapper

### Dependency management with requirement files

You can write a `requirements.txt` to manage your project dependencies. Write it in the form

    <package_name>=<version>

or you can write use pip

    pip freeze > requirements.txt

Sometimes it is usefull to have multiple requirement files, eg. for different stages like `requriements/local.txt`, `requirements/staging.txt` and `requirements/production.txt`. This files can import a `requirements/base.txt` file, which includes packages that are used in all stages.

    -r base.txt

    ...


