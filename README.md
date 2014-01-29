
# Diffbot MATLAB API

Diffbot is a simple function that can be used to get the JSON response of any URL provided with parameters to this function. [Diffbot API](http://www.diffbot.com/products/automatic/). Currently it supports Article, FrontPage, Product, Image and Classifier (Analyze) APIs.


## Requirements

The following files will be needed to use this API:

* Diffbot.m
* +json (Full folder)


## Installation

#####Method 1:
MATLAB uses the scope for the files/function available in the current folder. The current folder can be viewed by typing the following command on command prompt.

	>> pwd

	ans =

	D:\Diffbot

All the files can be placed in the current folder by copying the files or extracting the zip file to the current working directory.

#####Method 2:
Place the (extract/copy) the provided files to a desired location, then type the following on the command prompt.
	
	Syntax:
	addpath('PATH TO THE FOLDER');

	Usage:
	>> addpath('C:\Diffbot');

	If the path is added MATLAB will return no error and wont reply with any message.

#####Method 3:
To add the directory to Paths ,browse to the folder 'Diffbot' in 'current folder view' , right click the folder ,Navigate the menu to Add to Path > Selected folder and subfolders


## Usage

This library is written in a very simple manner, it can be accessed likewise a simple MATLAB Function. Some examples are presented. The file RunDemo.m show a live example. Please obtain a developer token from the website. The function Diffbot will return a structure.

### Example 1:

	addpath('./');     % Adding the path of the current working Directory 
	json.startup


	URL     =   'http://www.xconomy.com/san-francisco/2012/07/25/diffbot-is-using-computer-vision-to-reinvent-the-semantic-web/';
	token   =   'DIFFBOT_TOKEN';
	API     =   'analyze';
	fields  =   {'title','images(*)'};
	version =   '2';

	JSON_Return=diffbot(URL,token,API,fields,version); % This return is in Json format
	MATLAB_RETURN=json.load(JSON_Return);  % Converting The Json Response to Structures Easily Accessible by Matlab


For detailed available parameters consult [Product API docs] (http://www.diffbot.com/products/automatic/product/).

### Example 2:

	Syntax:
	diffbot(url, token, api, fields,version)

	Usage:
	addpath('./');     % Adding the path of the current working Directory 
	json.startup
	JSON_Return=diffbot('http://www.xconomy.com/san-francisco/2012/07/25/diffbot-is-using-computer-vision-to-reinvent-the-semantic-web/','b89d1f54fe8ea4b6ed1a0ff14b59d517','analyze',{'title','images(*)'},'2');
	MATLAB_RETURN=json.load(JSON_Return);  % Converting The Json Response to Structures Easily Accessible By Matlab


### Example 3: (Specifying fields)
The user can specify a single or a set of multiple fields

	To specify a single field the argument field can be kept as
	Syntax:
	fields  =   {'Field_Name'};

	Usage:
	fields  =   {'title'};


	To specify multiple field the values can be separated by a 	comma.
	Syntax:
	fields  =   {'Field_1','Field_2','Field_3'};
	Usage:
	fields  =   {'title','images(*)'};


### Example 4 :( Using values returned)
	
	To View contents of the Structure Type
	>> MATLAB_RETURN
	
	
	The Sub Fields can be vied or used by adding a dot after the structure name
	Example: To view the name of the author type
	
	>> MATLAB_RETURN.author


-Initial commit by Abdullah Khan-
