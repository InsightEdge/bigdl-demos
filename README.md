# Inisightedge & BigDL

Use Insightedge 1.0.0

*dist* dir - temporarily saved jar file there which allows to run a TextClassification example in Zeppelin. It also contains configuration file for spark, you might need to set this properties for Zeppelin interpreter but I'm not sure.

*zeppelin* dir - contains zeppelin files: notebooks and etc.

*runTextClassification.sh* - runs text classification example as spark job. 


### Running Image classification example

* Clone and build [forked BigDL project](https://github.com/dgur1n/BigDL/tree/insightedge) form *insightedge* branch
* Download pre-trained [model](https://d2j0dndfm35trm.cloudfront.net/resnet-18.t7).
* Download [images](https://drive.google.com/a/gigaspaces.com/file/d/0BwNPwv-ltyVHMGVTbzNrOXRtTnM/view?usp=sharing)
* Specify path ro model, images and BigDL jar in rumImageClassification.sh
* run rumImageClassification.sh. Compare with image categories [here](https://github.com/facebook/fb.resnet.torch/blob/master/pretrained/imagenet.lua#L1)


### AWS AMI

If you wish to run the demo on an EC2 instance, you can use the private AMI ami-07a02f28095fd6f6e(Ireland) or ami-0b3b158ac47ab8833 (Ohio).
The AMI is a private one that is available in Ireland and Ohio regions (can be easily copied to differnet regions). It is under our SEs AWS account.

Instructions:

1. Have SSH Key and a Security Group with ports 22, 8080 and 9443 opened. If you are going to use the instance multiple times, an Elastic IP might be useful.
2. Start new EC2 Instance / Spot instance(Spotinst) with the relevant AMI. It was tested with t2.2xlarge instance.
3. After the instance has started, SSH into it and run `supervisorctl start bigdl` . This will start the text classification job and once it finishes (10 mins~), it starts the BigDL WebUI and the long running Job that "listens" for inputs from the BigDL WebUI.

You can monitor the progress via Spark Master UI: http://<PUBLIC_IP>:8080/
The BigDL WebUI will be available at:  https://<PUBLIC_IP>:9443/

