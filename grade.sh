CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo 'Correct File Submitted'
else
    echo 'Correct File Not Submitted'
    exit
fi

cp student-submission/ListExamples.java TestListExamples.java grading-area

javac -cp $CPATH grading-area/*.java
if [[ $? -ne 0 ]]
then
    echo 'Compilation Error'
    exit
fi

cd grading-area
java -cp ".:../lib/junit-4.13.2.jar:../lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
