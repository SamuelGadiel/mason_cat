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

A brick for [Mason CLI](https://github.com/felangel/mason) that generates a clean architecture template for a given feature.


## 📖 Introduction

This brick was created to improve performance while developing new features for a [Flutter](https://flutter.dev/) project.

For a best fit, the project must follows a set of rules from Clean Architecture, specifically from [Clean-Dart](https://github.com/Flutterando/Clean-Dart)

For the purpose of keeping things easy, I have modified some ideas of the Clean-Dart, and implemented some other points that I think it's important for a project.\
The complete code structure is the next:

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

- `module_name`:\
  The name of the module you want to generate.

  > ⚠️ The brick was projected to work with [snake_case](https://en.wikipedia.org/wiki/Snake_case) names. ⚠️
  > 
  > Using any other case when setting `module_name` can result in code not being correctly structured.
  
  Defaults to `feature`. 


- `has_parameters`:\
  A boolean variable that defines if the module will send parameters to the backend.

  If set to `true` it will generate a parameters entity and mapper, that will be used throught the layers.\
  If set to `false` it won't generate the entity and mapper.

  Defaults to `false`.

### 🔒 Internal Variables

As said, I've modified the Clean-Dart structure while building this brick.\
One of those things is that I have some "custom files" that are needed throught the layers, but the brick can't identify those files since you can run it in any folder of the project.\
The solution was to create a pre-generation script (basically a hook) that will identify the root of the app (the lib folder) and define some paths from this point.

For example, I have a generic class named Failure that I use in the architecture.\
The pre-gen script will get the path of this file and concatenate to the lib path, so it can be set as a variable and imported wherever it's needed.\
The user don't have to manually import it.

If, for any reason, the pre-gen script can't find a lib folder it will simply return, the variables won't be setted, and the imports won't appear.

Talking about those internal variables, they are five and their respective values are:

- `failure_path`:\
  The path to the generic Failure, a generic class that all failures in the project must implement.

  Path to file: `project_name/lib/app/core/shared/domain/failures/failure.dart`

- `request_client_path`:\
  The path to the request client used in the project, in this case I've created an abstraction of a request client, which is what it's going to be imported.

  Path to file: `project_name/lib/app/core/packages/request_client/request_client.dart`

- `services_settings_path`:\
  The path to the services settings, which is the base endpoint to all requests.

  Path to file: `project_name/lib/app/core/shared/external/settings/services_settings.dart`

- `generic_query_path`:\
  The path to the generic query structure, which gives the base strcture of query parameters for all requests.

  Path to file: `project_name/lib/app/core/shared/infrastructure/mappers/name_method_query_mapper.dart`
  
- `message_parser_path`:\
  The path to a message parser. If the backend returns anything other than a success this class can parse and return a message.

  Path to file: `project_name/lib/app/core/helpers/server_error_message_parser.dart`


### ⚙️ How to run it

If you have already used any mason brick you basically know what to do. But I'll explain some details and give some tips.

#### 🛠️ Installing this brick

At the time of this creation, only allowed people can publish to the [BrickHub](https://brickhub.dev/) since it's on open alpha.\
I have requested access so it can be publically available for you, but until then you can use the following steps to install this brick:

1. Install mason through the dart command\
   I found that the best way to install mason is by using [their recommended way](https://docs.brickhub.dev/installing/#-pubdev).

   This can be done by running this dart command in the terminal

   ```bash
   dart pub global activate mason_cli
   ```
   
   Keep in mind that if you use multiple versions of the Dart SDK you can see a warning while running the brick with a different dart version than the one you have installed the mason. The terminal shows a message saying it couldn't find the kernel, but at the end it manages to run the brick with no further issues.

   About the homebrew version...\
   I have tried the homebrew version, but it install a full version of the Dart SDK, even if you already have a version (or multiple) installed.\
   It just adds another version of the Dart SDK. This discouraged me to use the homebrew version.

2. Install the CAT brick\
   Once mason is isntalled you have to install the CAT brick to it.\
   There are two ways of installing bricks using mason, locally or globally.\
   I'd recommend that you install it globally so you can use it in any flutter project, but if you just need it to a single project, you can install it locally.

   
   In the future you will be able to do this just by running

   ```bash
   # Local install
   mason add cat

   # Global install
   mason add cat -g
   ```

   But for now you will have to install it referencing this repository. You can do this by using the following command

   ```bash
   # Local install
   mason add cat -g --git-url https://github.com/SamuelGadiel/mason_cat

   # Global install
   mason add cat -g --git-url https://github.com/SamuelGadiel/mason_cat
   ```

#### ▶️ Using this brick

There are two ways of using bricks. You can simply execute it in the terminal or, if you're using [Visual Studio Code](https://code.visualstudio.com/), you can install an extension that will help you running it inside a project.

- Using the terminal\
  If you want to use the terminal you can basically run this command

  ```bash
  mason make cat
  ```

  It will ask for the `module_name` and `has_parameters` variables.\
  Once you have entered those informations it will generate everything you need for the module

  Another way you can run this command is by passing the `module_name` and `has_parameters` variables directly in the command

  ```bash
  mason make cat --module_name 'your_module_name' --has_parameters false
  ```

  Mason will ask for any informations that are ommited, in case you don't pass it.

- Using the VS Code extension\
  Another way of running the brick, and my favorite one, is by installing the [Mason](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.mason) extension for VS Code.

  This exteension allows you to run any brick installed in the machine, locally or globally.\
  For this, just right-click the folder where you want to generate the module and select the respective option

  
  ![Mason action](https://github.com/SamuelGadiel/mason_cat/assets/22757108/7e978c88-dfce-4b71-b482-13727ac095a4)

  It will show a pop-up asking for you to select the brick you want to run, then it will ask for the necessary variables.\
  After inserting all the informations the module will be generated.

  


---

## ⭐️ Credits

The logo is build using an asset from [FlatIcon](https://www.flaticon.com/).

<a href="https://www.flaticon.com/free-icons/pet" title="pet icons">Pet icons created by Freepik - Flaticon</a>

All credits are given to the respective creators.
