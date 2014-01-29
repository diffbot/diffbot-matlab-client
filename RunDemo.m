% This is the Demo file . This file shows and example how to use some Open
% Source Coder and Decoders for Matlab to JSON vice versa

clear
clc



disp('Diffbot Demo for MATLAB');




% STEP 1: Adding Path to functions
%-----------------------------------------------------------------------
addpath './';     % Adding the path of the current working Directory 
json.startup





% STEP 2:
%-----------------------------------------------------------------------


%Argumnts for the function

URL     =   'http://www.xconomy.com/san-francisco/2012/07/25/diffbot-is-using-computer-vision-to-reinvent-the-semantic-web/';
token   =   'DIFFBOT_TOKEN';
API     =   'analyze';
fields  =   {'title','images(*)','videos'};
version =   '2';



% Possible Values for fields
%url                 URL submitted. Returned by default.
%resolved_url        Returned if the resolving URL is different from the submitted URL (e.g., link shortening services). Returned by default.
%icon                Page favicon. Returned by default.
%meta                Returns the full contents of page meta tags, including sub-arrays for OpenGraph tags, Twitter Card metadata, schema.org microdata, and -- if available -- oEmbed metadata. Returned with fields.
%querystring         Returns the key/value pairs of the URL querystring, if present. Items without a value will be returned as "true." Returned with fields.
%links               Returns all links (anchor tag href values) found on the page. Returned with fields.
%type                Type of page -- always article. Returned by default.
%title               Title of extracted article. Returned by default.
%text                Plain-text of the extracted article. Returned by default.
%html                HTML of the extracted article. Returned by default.
%numPages            Number of pages automatically concatenated to form the text or html response (By default, Diffbot will automatically concatenate multiple-page articles.)
%date                Article date, normalized in most cases to GMT. Returned by default.
%author              Article author. Returned by default.
%tags                Array of tags, automatically generated by Diffbot natural-language-processing. Returned with fields.
%humanLanguage       Returns the (spoken/human) language of the submitted URL, using two-letter ISO 639-1 nomenclature. Returned with fields.
%images              Array of images, if present within the article body. Returned by default.
%url                 Direct (fully resolved) link to image.
%pixelHeight         Image height, in pixels.
%pixelWidth          Image width, in pixels.
%caption             Diffbot-determined best caption for the image, if detected.
%primary             Returns "true" if image is identified as primary based on visual analysis of the page.
%videos              Array of videos, if present within the article body. Returned by default.
%url                 Direct (fully resolved) link to the video content.
%pixelHeight         Video height, in pixels, if accessible.
%pixelWidth          Video width, in pixels, if accessible.
%primary             Returns "true" if the video is identified as primary based on visual analysis of the page.


disp('Reading Response from API Please Wait......');

JSON_Return=diffbot(URL,token,API,fields,version);

disp('Done......');


%Step 3: Parsing JSON Response to MATLAB Local Variables
%-----------------------------------------------------------------------
MATLAB_RETURN=json.load(JSON_Return);





%Step 4: Parsing JSON Response to MATLAB Local Variables
%-----------------------------------------------------------------------
%Using The Return Values (Just for Example ) See the structure (ie type
%MATLAB_RETURN and press Enter)


% Using Author Name (MATLAB_RETURN.author),
%disp(strcat('Author Name : ',MATLAB_RETURN.author));

% Using Title (MATLAB_RETURN.title)
disp(strcat('Title : ',MATLAB_RETURN.title));


% Using URL (MATLAB_RETURN.url)
disp(strcat('URL : ',MATLAB_RETURN.url));

% Show Images Retrieved


%Total Images Found
total_images=size(MATLAB_RETURN.images,2);
figure;
disp('Please Wait ! Downloading images from webpage to show');
for i= 1:total_images
    
    subplot(total_images,1,i),title('Images Read from webpage');;
    imshow(imread(MATLAB_RETURN.images{i}.url));
    
    
end
    
    
    





