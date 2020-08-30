#!/bin/bash                                                                                                       
                                                                                                                      
# Client script to pull Yahoo Finance historical data, off of its new cookie                                          
# authenticated site. Start/End Date args can be any GNU readable dates.                                              
# Script requires: GNU date, curl and bash shell                                                                      
                                                                                                                      
symbol=$1                                                                                                             
startDate=$2                                                                                                          
endDate=$3                                                                                                            
                                                                                                                      
startEpoch=$(date -d "$startDate" '+%s')                                                                              
endEpoch=$(date -d "$endDate" '+%s')                                                                                  
                                                                                                                      
cookieJar=$(mktemp)                                                                                                   
function cleanup() {                                                                                                  
    rm $cookieJar                                                                                                     
}                                                                                                                     
trap cleanup EXIT                                                                                                     
                                                                                                                      
function parseCrumb() {                                                                                               
    sed 's+}+\n+g'  | grep CrumbStore | cut -d ":" -f 3 | sed 's+"++g'                                                                                
}                                                                                                                     
                                                                                                                      
function extractCrumb() {                                                                                             
    crumbUrl="https://ca.finance.yahoo.com/quote/$symbol/history?p=$symbol"                                           
    curl -s --cookie-jar $cookieJar $crumbUrl | parseCrumb                                                                                                 
}                                                                                                                     
                                                                                                                      
crumb=$(extractCrumb)                                                                                                 
                                                                                                                      
baseUrl="https://query1.finance.yahoo.com/v7/finance/download/"                                                       
args="$symbol?period1=$startEpoch&period2=$endEpoch&interval=1d&events=history"                                       
crumbArg="&crumb=$crumb"                                                                                              
sheetUrl="$baseUrl$args$crumbArg"                                                                                     
                                                                                                                      

curl -o /home/juanma/scripts/crypto/prices -s --cookie $cookieJar "$sheetUrl" 

#{
#awk 'BEGIN {FS = ","}; $5~/[0-9]/{print $5}' /home/juanma/scripts/crypto/prices | sed 's/\.[0-9]*//g'|  feedgnuplot --lines --points  --title "Precio BTC-USD"  --terminal 'dumb 80,40' --exit 
#} 
