#!/bin/sh
OUTPUT=$BUILT_PRODUCTS_DIR/BuildIPA.config

rm -f $OUTPUT
echo "SDK=$SDK" >> $OUTPUT
echo "AppPath=\"$CODESIGNING_FOLDER_PATH\"" >> $OUTPUT
echo "IPAPath=\"$SYMROOT/$TARGET_NAME.ipa\"" >> $OUTPUT
echo "CodeSignIdent=\"$IPA_CODE_SIGN_IDENTITY\"" >> $OUTPUT
echo "ProvisioningProfile=\"$PROVISIONING_PROFILE_DIR/$CONFIGURATION.mobileprovision\"" >> $OUTPUT
