#!/bin/sh

python -m xmljson -o PhoneNumberMetadataTemp.json -d yahoo "$(pwd)/Original/PhoneNumberMetadata.xml"

# Produce json resource
cat PhoneNumberMetadataTemp.json | sed 's/\\n//g' | sed 's/ \{3,\}//g' | sed 's/   //g' | tr -d "\n" > PhoneNumberMetadata.json

# Produce json Swift var
echo "let phoneNumberMetedata = \"\"\"" > PhoneNumberMetadata.swift
cat PhoneNumberMetadata.json >> PhoneNumberMetadata.swift
echo "\n\"\"\"" >> PhoneNumberMetadata.Swift

rm PhoneNumberMetadataTemp.json
