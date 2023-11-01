ifeq ($(VERSION),)
     VERSION:=$(shell git describe --tags --abbrev=0 | awk -F .   '{OFS="."; $$NF+=1; print}')
endif



all:
 echo $(VERSION)

