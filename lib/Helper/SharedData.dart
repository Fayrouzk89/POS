import 'dart:io';

import 'LocalDataHelper.dart';


class SharedData
{
  static Future initAppModule()async
  {
    try
        {
          String languageCode = Platform.localeName;
          if(languageCode!=null && languageCode.toLowerCase().contains("ar"))
            {
              LocalDataHelper.lang="ar";
            }
          else
            {
              LocalDataHelper.lang="en";
            }
        }
        catch(e)
        {

        }
  }
}