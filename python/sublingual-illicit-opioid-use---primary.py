# Lewer D, Padmanathan P, Arfeen A, Denaxas S, Forbes H, Gonzalez-Izquierdo A, Hickman M, 2023.

import sys, csv, re

codes = [{"code":"x10045241000033110","system":"med"},{"code":"x10045441000033111","system":"med"},{"code":"x10045641000033113","system":"med"},{"code":"x1835341000033111","system":"med"},{"code":"x1835441000033117","system":"med"},{"code":"x6056","system":"med"},{"code":"x6547","system":"med"},{"code":"x10045241000033110","system":"prod"},{"code":"x10045441000033111","system":"prod"},{"code":"x10045641000033113","system":"prod"},{"code":"x1835341000033111","system":"prod"},{"code":"x1835441000033117","system":"prod"},{"code":"x6056","system":"prod"},{"code":"x6547","system":"prod"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('illicit-opioid-use-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["sublingual-illicit-opioid-use---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["sublingual-illicit-opioid-use---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["sublingual-illicit-opioid-use---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
