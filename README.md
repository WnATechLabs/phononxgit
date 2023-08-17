## How to run the project
1. Generate a github token: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens
2. go to the file `<projectRoot>/lib/core/external/http_client/dio.dart` and replace "<your personal github's fine grained token here>" with the github token you generated in the previous step
  ![image](https://github.com/WnATechLabs/phononxgit/assets/105955914/75532da5-dce5-4295-9448-59b0b36bcefe)
3. at the root of the project run the command: `flutter pub get && flutter pub run build_runner build && flutter run`
   * this will install dependencies, auto generated the necessary files and finally run the app.



## TODOS:
* fetch the repo count for each user
* implement repository pattern
* dependency injection
* add tests
