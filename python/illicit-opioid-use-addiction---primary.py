# Lewer D, Padmanathan P, Arfeen A, Denaxas S, Forbes H, Gonzalez-Izquierdo A, Hickman M, 2023.

import sys, csv, re

codes = [{"code":"x10538","system":"med"},{"code":"x316901000000118","system":"med"},{"code":"x379281000006110","system":"med"},{"code":"x388831000006113","system":"med"},{"code":"x43487","system":"med"},{"code":"x4564","system":"med"},{"code":"x10538","system":"prod"},{"code":"x316901000000118","system":"prod"},{"code":"x379281000006110","system":"prod"},{"code":"x388831000006113","system":"prod"},{"code":"x43487","system":"prod"},{"code":"x4564","system":"prod"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('illicit-opioid-use-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["illicit-opioid-use-addiction---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["illicit-opioid-use-addiction---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["illicit-opioid-use-addiction---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
