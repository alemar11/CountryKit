generate:
	./Vendor/gyb --line-directive '' -o ./Sources/Countries.swift ./Vendor/countries.swift.gyb.py

.PHONY: generate
	