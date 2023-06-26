# Clean Architecture Template (CAT)

<p align="center">
<img src="https://github.com/SamuelGadiel/mason_cat/assets/22757108/526e8e56-6882-4d3e-9a6a-72e17de2c48f" height="172" alt="CAT logo" />
</p>

<p align="center">

<a href="https://github.com/SamuelGadiel/mason_cat">
  <img alt="GitHub page" src="https://img.shields.io/github/license/SamuelGadiel/mason_cat">
</a>

<a href="https://github.com/SamuelGadiel/mason_cat/commits/main">
  <img alt="Commits" src="https://img.shields.io/github/commit-activity/t/SamuelGadiel/mason_cat?logo=github">
</a>

<a href="https://dart.dev">
  <img alt="Language Used" src="https://img.shields.io/badge/language-Dart-blue?logo=dart">
</a>



<a href="https://github.com/felangel/mason">
  <img alt="Mason Reference" src="https://img.shields.io/badge/reference-Mason-green?logo=github">
</a>

</p>

---

A brick for Mason CLI that generates a clean architecture template for a given feature.


## 📖 Introduction

This brick was created to improve performance while developing new features to a Flutter project.

For a best fit, the project must follows a set of rules from Clean Architecture, specifically from [Clean-Dart](https://github.com/Flutterando/Clean-Dart)

For the purpose of keep things easy I have modified some ideas of the Clean-Dart, and implemented some other points that I think it's important for the project. The complete code structure is the next:

- Domain
  - Entities
  - Failures
  - Repositories
  - Usecases
  - Validators (Not supported)
- Infrastructure
  - Mappers
  - Datasources
  - Errors
  - Repositories
- External
  - Datasources
  - Settings (in some cases)
- Presentation
  - Controllers
    - Bloc
      - Events
      - States
    - Stores
  - Pages (Not supported)
  - Widgets (Not supported)

This structure is detailed in the ARCHITECTURE.md file.

## 🚀 Getting Started


### 🧩 Variables

This brick has currently two variables that can be set by the user, they are

- `module_name`:

  The name of the module you want to create.

  Default to `feature`.

  > ⚠️ The brick was projected to work with [snake_case](https://en.wikipedia.org/wiki/Snake_case). ⚠️
  > 
  > Using other case when setting `module_name` can result in code not being correctly structured.


- `has_parameters`:

  A boolean variable that defines if the module will pass some parameters to the backend.

  If set to `true` it will generate a parameters entity and mapper that will be used throught the layers.

  If set to `false` it won't generate the entity and mapper.

  Defaults to `false`.

### 🔒 Internal Variables

As said, I've modified the Clean-Dart structure while building this brick. One of those things is that I have some custom files that are used throught the layers, but the brick can't identify those files since you can run it in any folder of the project.

The solution was to create a pre-generation script (basically a hook) that will identify the root of the app (the lib folder) and set some paths from this lib folder.

For example, I have a generic class named Failure that I use in the architecture. The pre-gen script will get the path of this file and add to the lib path, so it can be set as a import wherever it's needed. The user don't have to manually import it.

If, for any reason, the pre-gen script can't find a lib folder it will simply return, the variables won't be setted, and the imports won't appear.

Talking about those internal variables, they are five and their respective paths are:

- `failure_path`:

  The path to the generic Failure, a generic class that all failures in the project must implement.

  Path to file: `project_name/lib/app/core/shared/domain/failures/failure.dart`

- `request_client_path`:

  The path to the request client used in the project, in this case I've created an abstraction of a request client, which is what it's going to be imported.

  Path to file: `project_name/lib/app/core/packages/request_client/request_client.dart`

- `services_settings_path`:

  The path to the services settings, which is the base endpoint to all requests.

  Path to file: `project_name/lib/app/core/shared/external/settings/services_settings.dart`

- `generic_query_path`:

  The path to the generic query structure, it gives a base that all requests use.

  Path to file: `project_name/lib/app/core/shared/infrastructure/mappers/name_method_query_mapper.dart`
  
- `message_parser_path`:

  The path to a message parser. If the backend returns anything other than a success this class can parse and return a message of the problem.

  Path to file: `project_name/lib/app/core/helpers/server_error_message_parser.dart`


### ⚙️ How to run it

You can run the brick using the command

```
mason make cat
```


---

## ⭐️ Credits

The logo is build using an asset from [FlatIcon](https://www.flaticon.com/).

<a href="https://www.flaticon.com/free-icons/pet" title="pet icons">Pet icons created by Freepik - Flaticon</a>

All credits are given to the respective creators.
