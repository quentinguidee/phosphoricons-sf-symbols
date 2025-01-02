generate:
    #!/bin/sh
    iconsFile=./Sources/PhosphorIconsSwift/Icons.swift
    rm $iconsFile
    touch $iconsFile
    echo "import SwiftUI" >> $iconsFile
    echo "" >> $iconsFile
    echo "public enum PhIcons: String {" >> $iconsFile
    for filepath in ./Core/assets/regular/*.svg; do
        filename="${filepath##*/}"
        filenameWithoutExt="${filename%.svg}"
        iconName=$(echo "$filenameWithoutExt" | perl -pe 's/(-)(\w)/\U$2/g')
        swiftdraw $filepath \
            --format sfsymbol \
            --output ./Out/${filename} \
            --black ./Core/assets/regular/${filenameWithoutExt}.svg \
            --ultralight ./Core/assets/regular/${filenameWithoutExt}.svg \
            --insets 24,24,24,24 \
            --ultralightInsets 24,24,24,24 \
            --blackInsets 24,24,24,24
        echo "    case \`${iconName}\` = \"${filenameWithoutExt}\"" >> $iconsFile
    done
    echo "    public var icon: Image {" >> $iconsFile
    echo "        Image(self.rawValue, bundle: .module)" >> $iconsFile
    echo "    }" >> $iconsFile
    echo "}" >> $iconsFile
