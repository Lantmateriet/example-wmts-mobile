# Getting started consuming WMTS in mobile apps
A short example of how to consume Lantmäteriets (Swedish National Land Survey) open geodata from a web map tile service (WMTS) in a mobile application.

## Running the Examples
To get map data from the wmts you need to get an API key and insert it into the code:

* First you need to create a [user account](https://opendata.lantmateriet.se/#register) (web page in swedish only) to acquire your API-key.

* You also need to have the toolchains installed for your platform of choice.

### Andoid (Android Studio)
You have to update the file [MapsActivity.java](./Android/MapsActivity.java) with your API token:
```
//TODO: Insert your API key here
private static final String OPPNADATA_URL =
    "https://api.lantmateriet.se/open/topowebb-ccby/v1/wmts/token/<MY OPEN DATA TOKEN>/1.0.0/topowebb/default/3857/%d/%d/%d.png";
```
Create a new Google Maps Activity Project in Android studio. Make sure you have your Google API key in `google_maps_api.xml`.
Replace the `AndroidStudioProjects/MyApplication/app/src/main/java/com/example/MapsActivity.java` with the [file](./Android/MapsActivity.java) from this repository.
Run your app!

### iOS (Xcode)
Open the [iOS Playground](iOSPlayground.playground) in Xcode and follow along!

## Documentation

For detailed documentation how to use the WMTS provided, read the ducumentation: [Topografisk webbkarta Visning, Översiktlig - v1](https://opendata.lantmateriet.se/#apis?api=OpenDataWMTS&version=v1).

For more information about open data at Lantmäteriet, see [Lantmäteriet - Öppna geodata](https://www.lantmateriet.se/sv/Kartor-och-geografisk-information/oppna-data/).

## License
Copyright 2019 Lantmäteriet

Licensed under the Apache License, Version 2.0 (the License);
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an AS IS BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.