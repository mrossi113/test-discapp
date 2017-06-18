package discapp;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by cruot on 6/16/2017.
 */
public class Round {
    private Date date;
    private String course_name;

    private ArrayList<Integer> scores;

    public Round(Date date, String course_name, ArrayList<Integer> scores)
    {
        this.date = date;
        this.course_name = course_name;
        this.scores = scores;
    }

    public Date getDate() {
        return date;
    }

    public String getCourse_name() {
        return course_name;
    }

    public ArrayList<Integer> getScores() {
        return scores;
    }

    public int getTotalScore() {
        int sum = 0;
        for(int score : this.scores)
            sum += score;
        return sum;
    }

    public String getDateString() {
        String dateString = new SimpleDateFormat("MM-dd-yyyy").format(this.date);
//        String dateString = this.date.toString();
        System.out.println(dateString);
        return dateString;
    }
}
