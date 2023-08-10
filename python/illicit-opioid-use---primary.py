# Lewer D, Padmanathan P, Arfeen A, Denaxas S, Forbes H, Gonzalez-Izquierdo A, Hickman M, 2023.

import sys, csv, re

codes = [{"code":"x968661000006113","system":"med"},{"code":"x969061000006110","system":"med"},{"code":"x969071000006115","system":"med"},{"code":"x969081000006117","system":"med"},{"code":"x969101000006113","system":"med"},{"code":"x969111000006111","system":"med"},{"code":"x969121000006115","system":"med"},{"code":"x969141000006110","system":"med"},{"code":"x969151000006112","system":"med"},{"code":"x969161000006114","system":"med"},{"code":"x969171000006119","system":"med"},{"code":"x969181000006116","system":"med"},{"code":"x969191000006118","system":"med"},{"code":"x969201000006115","system":"med"},{"code":"x969211000006117","system":"med"},{"code":"x969221000006113","system":"med"},{"code":"x969251000006116","system":"med"},{"code":"x969281000006112","system":"med"},{"code":"x969341000006113","system":"med"},{"code":"x969361000006112","system":"med"},{"code":"x968661000006113","system":"prod"},{"code":"x969061000006110","system":"prod"},{"code":"x969071000006115","system":"prod"},{"code":"x969081000006117","system":"prod"},{"code":"x969101000006113","system":"prod"},{"code":"x969111000006111","system":"prod"},{"code":"x969121000006115","system":"prod"},{"code":"x969141000006110","system":"prod"},{"code":"x969151000006112","system":"prod"},{"code":"x969161000006114","system":"prod"},{"code":"x969171000006119","system":"prod"},{"code":"x969181000006116","system":"prod"},{"code":"x969191000006118","system":"prod"},{"code":"x969201000006115","system":"prod"},{"code":"x969211000006117","system":"prod"},{"code":"x969221000006113","system":"prod"},{"code":"x969251000006116","system":"prod"},{"code":"x969281000006112","system":"prod"},{"code":"x969341000006113","system":"prod"},{"code":"x969361000006112","system":"prod"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('illicit-opioid-use-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["illicit-opioid-use---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["illicit-opioid-use---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["illicit-opioid-use---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
