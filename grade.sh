#CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
CPATH='".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"'
CPATHRUN='".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar"'

echo $CPATH
echo $CPATHRUN

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission



if [[ -f ListExamples.java ]]
then
    echo "ListExamples found."
else
    echo "Need file ListExamples.java."
    exit 1
fi

cp ../TestListExamples.java ./
cp -r ../lib ./

ls

pwd

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java 2>test-list-output.txt
#javac ListExamples.java 2>output.txt

if [ $?=='0' ]
then   
    echo "Compile successful!"
else   
    echo "Error found."
    cat output.txt
fi

ls

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > test-output.txt

cat test-output.txt


