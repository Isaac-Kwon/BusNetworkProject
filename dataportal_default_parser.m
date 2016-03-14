clc;
clear;

readURL = 'http://test.test.test';  %URL to recieve list of RouteID
Key = '000' ;  %insert Service code from Data.go.kr
readXML = [readURL '?serviceKey='  Key];

%Require the Parsing URL and ServiceKey

XMLFile = xmlread(readXML);


list = XMLFile.getElementsByTagName('row');
Routelist = 0;

numlist = 1;


for rownum = 0:list.getLength-1
    ele = list.item(rownum).getElementsByTagName('ROUTE_ID');
    Routelist(rownum+1,numlist) = str2num(ele.item(0).getFirstChild.getData);
end

Routelist

clear readURL readXML list numlist;



numlist = 1;
Stationlist = 0;



for readNum = 1 : length(Routelist)

readURL = 'http://openapi.changwon.go.kr/rest/bis/BusLocation/';

readXML = [readURL '?serviceKey='  Key '&route=' num2str(Routelist(readNum))];

XMLFile = xmlread(readXML);

xmlwrite(XMLFile);

list = XMLFile.getElementsByTagName('row');


%finding route on 1 busnumber


for rownum = 0:list.getLength-1
    ele = list.item(rownum).getElementsByTagName('STATION_ID');
    Stationlist(rownum+1,numlist) = str2num(ele.item(0).getFirstChild.getData);
end


numlist = numlist + 1 

end

Stationlist = [Routelist' ;Stationlist]

clear ele key list numlist readNum readURL readXML rownum Routelist xmlFile
