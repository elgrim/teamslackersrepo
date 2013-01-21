using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Dice
/// </summary>
public class Dice
{

    private double roll1, roll2;
    string message_bad = "Too bad, you got double 6. Here's your 'reward'.";
    string message_good = "Good job, here's your reward.";
    private bool yuri = false;
    private bool yaoi = false;

    Random random = new Random();

    // Getters/setters
    public double getRoll1()
    {
        return roll1;
    }
    
    public void setRoll1(double roll1)
    {
        this.roll1 = roll1;
    }

    public double getRoll2()
    {
        return roll2;
    }

    public void setRoll2(double roll2)
    {
        this.roll2 = roll2;
    }
    //


    // Constructor

	public Dice()
	{
		
        
	}

    public bool Doubles()
    {
        if (roll1 == roll2)
        {
            return true;
        }
        else 
        {           
        return false;
        }
    }

    public string Message()
    {
        if (roll1 != 6)
        {
            yuri = true;
            yaoi = false;
            return message_good;
            
        }
        else
        {
            yaoi = true;
            yuri = false;
            return message_bad;            
        }
    }

    public void Roll()
    {
        double r1 = random.Next(1, 7);
        double r2 = random.Next(1, 7);
        setRoll1(r1);
        setRoll2(r2);
    }

    public string ImageD()
    {
        double d = getRoll1();

        if (yuri == true)
        {
            return "yuri"+d.ToString();
        }
        else if (yaoi == true)
        {
            return "yaoi";
        }
        else return "owl";
    }

}