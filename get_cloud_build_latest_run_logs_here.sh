

source ./set_p.sh
echo

echo Times are UTC
echo Current Time
echo
date -u
echo
sleep 3
gcloud builds list | head -5
echo
sleep 7

echo ______________________________________________________________________________________
echo
LATEST_BUILD_ID=`gcloud builds list | head -2 | tail -1 | awk '{print $1}'`
echo
echo LATEST_BUILD_ID=$LATEST_BUILD_ID
echo
sleep 5


echo ______________________________________________________________________________________
echo
echo Getting Logs:
echo
sleep 2
gcloud builds log $LATEST_BUILD_ID
gcloud builds log $LATEST_BUILD_ID > ./tmp.build.log
echo SAME LOGS ARE ALSE SAVED IN tmp.build.log
echo
echo Numbers of errors in each step: Expected: 14 23 0 10
echo
echo -n "Step 1: " ; grep -i error tmp.build.log | grep "Step #1"  | wc -l
echo -n "Step 2: " ; grep -i error tmp.build.log | grep "Step #2"  | wc -l
echo -n "Step 3: " ; grep -i error tmp.build.log | grep "Step #3"  | wc -l
echo -n "Step 4: " ; grep -i error tmp.build.log | grep "Step #4"  | wc -l
echo
