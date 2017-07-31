# Inisightedge & BigDL

Use Insightedge 1.0.0

*dist* dir - temporarily saved jar file there which allows to run a TextClassification example in Zeppelin. It also contains configuration file for spark, you might need to set this properties for Zeppelin interpreter but I'm not sure.

*zeppelin* dir - contains zeppelin files: notebooks and etc.

*runTextClassification.sh* - runs text classification example as spark job. 


### Running Image classification example

* Clone and build [forked BigDL project](https://github.com/dgur1n/BigDL/tree/insightedge)
* Download pre-trained [model](https://d2j0dndfm35trm.cloudfront.net/resnet-18.t7).
* Download [images](https://drive.google.com/a/gigaspaces.com/file/d/0BwNPwv-ltyVHMGVTbzNrOXRtTnM/view?usp=sharing)
* Specify path ro model, images and BigDL jar in rumImageClassification.sh
* run rumImageClassification.sh