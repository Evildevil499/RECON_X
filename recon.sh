#!/bin/bash

#~~~~~~~~~~~~~~~~~~~~~~~~~Functions~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBDOMAINS()
{
output_dir="./recon_results"
mkdir -p $output_dir

printf "\nStarting Subdomain Enumeration\n" 
printf "Running Subfinder\n" 
printf "Enumerating..............\n"

subfinder -d $domain -silent > subdomains1.txt 
total_subs1=$(wc -l subdomains1.txt | awk '{print $1}')
echo "$total_subs1 subdomains found by Subfinder"

echo "==============================================="

printf "Running AssetFinder\n" 
assetfinder $domain > subdomains2.txt  2>/dev/null
total_subs2=$(wc -l subdomains2.txt  | awk '{print $1}')
echo "$total_subs2 subdomains found by AssetFinder"


echo "==============================================="

printf "Running Amass" 
amass enum -passive -d $domain > subdomains3.txt
total_subs3=$(wc -l subdomains3.txt | awk '{print $1}')
echo "$total_subs3 subdomains found by Amass"

echo "==============================================="

printf "Sorting Collected Subdomains\n" 
cat subdomains*.txt 2>/dev/null | anew final_subdomains.txt >/dev/null 2>&1


httpx -silent -l final_subdomains.txt > live_domains.txt
wc -l live_domains.txt | awk '{print $1 " subdomains are founded by Recon-x"}'
printf "Enumeration Completed Successfully"

echo "===============================================" 
mv live_domains.txt recon_results
mkdir trash 2>/dev/null
mv subdomains* trash/
mv final_subdomains.txt trash/
rm -r trash


}

WAYBACKURLS(){
mkdir wayback_urls 2>/dev/null ;
printf "Staring waybackurl\n"
printf "Delving into History........"
waybackurls $domain | sort -u > wayback_urls.txt 
mv wayback_urls.txt wayback_urls
printf "wayback_url  Completed.\n"


}

DIRECTORY ()
{
    
    printf "Starting Dirsearch\n"
    dirsearch -u http://$domain -o $domain.txt
    printf "Dirsearch Completed"

}

NUCLEI ()
{
    printf "Starting Nuclei Scan\n"
    nuclei -u $domain -o $domain.txt
    printf "Completed Nuclei Scan"

}


#~~~~~~~~~~~~~~~~~~~~~~~~~Main Code~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

read -p "-------------------------
Select an option(without -)
-s Gather subdomains
-w Gather wayback_urls
-d Perform Directory Bruteforce
-n Perform Nuclei Scans
-a All of the above
-------------------------
>>Option:" option

read -p "Enter the target domain(example: evil.com):" domain
mkdir results 2>/dev/null; mkdir results/$domain 2>/dev/null ; cd results/$domain;


case $option in
s)
SUBDOMAINS
;;
w)
WAYBACKURLS
;;

d)
DIRECTORY
;;

n)
NUCLEI
;;

a)
SUBDOMAINS
WAYBACKURLS
DIRECTORY
NUCLEI
;;

esac
printf "full scan Completed"
