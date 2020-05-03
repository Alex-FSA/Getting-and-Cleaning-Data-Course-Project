# **Getting and Cleaning Data** Course Project Code Book

File **Run_analysis.R** implements the steps described in course instructions.

## DataSeats and Variables
**1. Variables and summaries calculated**
<ul>
      <li>Features--> Rows:561 , Cols:2 </li>
      <li>Activities--> Rows:6 , Cols:2 </li>
      <li>Subject Test--> Rows:2.947, Cols:1 </li>
      <li>X Test--> Rows: 2.947, Cols:561 </li>
      <li>Y Test--> Rows: 2.647, Cols:1 </li>
      <li>Subject Train--> Rows: 7.352, Cols:1 </li>
      <li>X Train--> Rows: 7.352, Cols:561 </li>
      <li>Y Train--> Rows: 7.352, Cols:1 </li>
</ul>

**2. Merged Datasets summaries**
<ul>
      <li>Merged Subject --> Rows: 10.299, Cols: 1</li>
      <li>Merged X --> Rows: 10.299, Cols: 561</li>
      <li>Merged Y --> Rows: 10.299, Cols: 1</li>
      <li>Full Merged --> Rows: 10.299, Cols: 563</li>
</ul>

**3. Measurements on the mean and standard deviation for each measurement**
<ul>
      <li>ExtractData --> Rows: 10.229, Cols: 88. Selected Columns: subject and Code. Measurements: *mean* and *std*.</li>
</ul>

**4. Use descriptive activity names to name activities in data set.**
<ul>
      <li>Replace ExtractData with with correspondant activity taken from activities data set</li>
</ul>

**5. Label data set with descriptive names**
<ul>
      <li>Accelerometer replace Acc</li>
      <li>Gyroscope replace Gyro</li>
      <li>Body replace BodyBody</li>
      <li>Magnitude replace Mag</li>
      <li>Angle replace angle</li>
      <li>Gravity replace gravity</li>
      <li>Frequency replace column name started with f</li>
      <li>Time replace column name started with t</li>
</ul>

**6. New independent data set with average of each variable for activities and subjects**
<ul>
      <li>Second Data --> Rows: 180, Cols: 88</li>
      <li>Second data dataset export as FinalData.txt in working directory</li>
</ul>
