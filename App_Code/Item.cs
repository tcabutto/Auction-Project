using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Item
/// </summary>
public class Item
{

    ////////////////////////////////
    ///////////Variables///////////
    ///////////////////////////////


    private String name, category;
    private long key; //taken from database
    private double price;
    private DateTime dateCreated;
    //  private DateTime endDate;
    private User buyer;
    private User owner; //who originally posted the item
    private string seller; //who is actually selling the item
    private string description;
    private string endTime;
    private string endDate;


    ////////////////////////////////
    /////////Constructors//////////
    ///////////////////////////////


    /// <summary>
    /// Default Constructor
    /// </summary>
    public Item()
    {
        dateCreated = DateTime.Now;
        name = "";
        category = "";
        key = 0;
        price = 0.00;
        owner = null;
        buyer = null;
        // endDate = dateCreated.AddHours(1);
        seller = null;
    }

    /// <summary>
    /// Constructor takes values from the postItem page
    /// </summary>
    public Item(String name, String category, double price, string seller, int key, string description, string endTime, string endDate)
    {
        //dateCreated = DateTime.Now;
        this.endTime = endTime;
        this.endDate = endDate;
        this.name = name;
        this.category = category;
        this.price = price;
        buyer = null;
        //get owner???
        /* if (owner.Premium)
         {
             endDate = dateCreated.AddMonths(1);
         }
         else
         {
             endDate = dateCreated.AddDays(7);
         }*/
        this.seller = seller;
        this.key = key;
        this.description = description;
    }

    ////////////////////////////////
    ///////////Methods/////////////
    ///////////////////////////////

    /// <summary>
    /// adds the item to the database
    /// </summary>
    protected Boolean addToDB()
    {
        Boolean test = true;
        if (test == true)//if database doesnt contain the item
        {

            return true;
        }
        return false;
    }

    /// <summary>
    /// removes the item from the database
    /// </summary>
    protected Boolean removeFromDB()
    {
        Boolean test = true;
        if (test == true) //key is in the databse
        {
            //do stuff
        }
        return true;
    }

    /// <summary>
    /// gets the next available key from the database
    /// </summary>
    protected long getKey()
    {
        long newKey = 0;
        return newKey;
    }


    ////////////////////////////////
    /////Accessors and Mutators////
    ///////////////////////////////


    /// <summary>
    /// accessor/mutator for name
    /// </summary>
    public String Name
    {
        get { return name; }
        set { name = value; }
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
    /// accessor for key
    /// the value cannot be changed
    /// </summary>
    public long Key
    {
        get { return key; }
    }

    /// <summary>
    /// accessor/mutator for price
    /// </summary>
    public double Price
    {
        get { return price; }
        set { price = value; }
    }

    /// <summary>
    /// accessor for dateCreated
    /// value cannot be changed
    /// </summary>
    public DateTime DateCreated
    {
        get { return dateCreated; }
    }

    /// <summary>
    /// accessor for endDate
    /// value cannot be changed
    /// </summary>
    public string EndDate
    {
        get { return endDate; }
    }

    public string EndTime
    {
        get { return EndTime; }
    }

    /// <summary>
    /// accessor/mutator for buyer
    /// </summary>
    public User Buyer
    {
        get { return buyer; }
        set { buyer = value; }
    }

    /// <summary>
    /// accessor for owner
    /// value cannot be changed
    /// </summary>
    public User Owner
    {
        get { return owner; }
    }

    /// <summary>
    /// accessor/mutator for seller
    /// </summary>
    public String Seller
    {
        get { return seller; }
        set { seller = value; }
    }

    public string Description
    {
        get { return description; }
        set { description = value; }
    }
}