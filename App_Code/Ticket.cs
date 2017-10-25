using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Ticket
/// </summary>
public class Ticket
{


    ////////////////////////////////
    ///////////Variables///////////
    ///////////////////////////////


    private long id;
    private String category, subject;
    private User submitter;
    private Boolean status;


    ////////////////////////////////
    /////////Constructors//////////
    ///////////////////////////////


    /// <summary>
    /// default constructor
    /// </summary>
    public Ticket()
    {
        id = 0;
        category = "";
        subject = "";
        submitter = null;
        status = false;
    }

    /// <summary>
    /// constructor takes values from web page
    /// </summary>
    public Ticket(String category, String subject, User submitter)
    {
        id = getId();//retrieve available id from dtabase
        this.category = category;
        this.subject = subject;
        this.submitter = submitter;
        status = false;
    }


    ////////////////////////////////
    /////Accessors and Mutators////
    ///////////////////////////////


    public long getId()
    {
        //pull id from database
        return 0;
    }

    /// <summary>
    /// accessor for id
    /// cannot be changed
    /// </summary>
    public long Id
    {
        get { return id; }
    }

    /// <summary>
    /// accessor/mutator for category
    /// </summary>
    public String Category
    {
        get { return category; }
        set { category = value; }
    }

    /// <summary>
    /// accessor/mutator for subject
    /// </summary>
    public String Subject
    {
        get { return subject; }
        set { subject = value; }
    }

    /// <summary>
    /// accessor for submitter
    /// cannot be changed
    /// </summary>
    public User Submitter
    {
        get { return submitter; }
    }

    /// <summary>
    /// accessor/mutator for status
    /// </summary>
    public Boolean Status
    {
        get { return status; }
        set { status = value; }
    }
}