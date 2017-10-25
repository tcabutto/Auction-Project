using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{

    ////////////////////////////////
    ///////////Variables///////////
    ///////////////////////////////


    private Boolean premium;
    private String email, password, name, payment;
    private DateTime dateCreated;
    private Item[] listings, items;
    private User[] sellers; //Sells items for you
    private User[] clients; //customers that a seller is selling items for
    private int id;


    ////////////////////////////////
    /////////Constructors//////////
    ///////////////////////////////


    /// <summary>
    /// Default Constructor
    /// </summary>
    public User()
    {
        dateCreated = DateTime.Now;
        premium = false;
        email = "";
        password = "";
        name = "";
        payment = "";
        sellers = new User[5];
        //Premium account values
        if (premium == true)
        {
            listings = new Item[50];
            items = new Item[50];
            clients = new User[25];
        }
        //regular account values
        else
        {
            listings = new Item[10];
            items = new Item[10];
        }
        id = 0;
    }

    /// <summary>
    /// Constructor takes all inputs from the web page createAccount
    /// </summary>
    public User(Boolean premium, String email, String password, String name, String payment, int id)
    {
        dateCreated = DateTime.Now;
        this.premium = premium;
        this.email = email;
        this.password = password;
        this.name = name;
        this.payment = payment;
        this.id = id;
        sellers = new User[5];
        //Premium account values
        if (premium == true)
        {
            listings = new Item[50];
            items = new Item[50];
            clients = new User[25];
        }
        //regular account values
        else
        {
            listings = new Item[10];
            items = new Item[10];
        }
    }


    ////////////////////////////////
    ///////////Methods/////////////
    ///////////////////////////////


    





    ////////////////////////////////
    /////Accessors and Mutators////
    ///////////////////////////////

    /// <summary>
    /// accessor/mutator for premium
    /// </summary>
    public Boolean Premium
    {
        get { return premium; }
        set { premium = value; }
    }

    /// <summary>
    /// accessor/mutator for email
    /// </summary>
    public String Email
    {
        get { return email; }
        set { email = value; }
    }

    /// <summary>
    /// accessor/mutator for password
    /// </summary>
    public String Password
    {
        get { return password; }
        set { password = value; }
    }

    /// <summary>
    /// accessor/mutator for name
    /// </summary>
    public String Name
    {
        get { return name; }
        set { name = value; }
    }

    /// <summary>
    /// accessor/mutator for payment
    /// </summary>
    public String Payment
    {
        get { return payment; }
        set { payment = value; }
    }

    /// <summary>
    /// accessor for dateCreated
    /// value cannot be changed
    /// </summary>
    public DateTime DateCreated
    {
        get { return dateCreated; }
    }

    ///<summary>
    /// access for id
    /// id cannot be changed unless in database
    /// </summary>
    public int Id
    {
        get { return id; }
    }

    /// <summary>
    /// returns the item from listings where index=val
    /// </summary>
    public Item getListing(int val)
    {
        return listings[val];
    }

    /// <summary>
    /// returns the item from listings where name=val
    /// can return null
    /// </summary>
    public Item getListing(String val)
    {
        foreach(Item i in listings)
        {
            if(i.Name == val)
            {
                return i;
            }
        }
        return null;
    }

    /// <summary>
    /// returns the iitem from listings where key=val
    /// make sure input val is a long or it will seach for index instead of key
    /// can return null
    /// </summary>
    public Item getListing(long val)
    {
        foreach (Item i in listings)
        {
            if (i.Key == val)
            {
                return i;
            }
        }
        return null;
    }

    /// <summary>
    /// adds new item to listings array
    /// returns false if array is full
    /// </summary>
    public Boolean addListing(Item add)
    {
        for(int i = 0; i < listings.Length; i++)
        {
            if(listings[i] == null)
            {
                listings[i] = add;
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// removes item from listings
    /// returns false if item is not in listings
    /// </summary>
    public Boolean removeListing(String k)
    {
        for (int i = 0; i < listings.Length; i++)
        {
            if (listings[i] == getListing(k))
            {
                listings[i] = null;
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// removes item from listings
    /// returns false if item is not in listings
    /// </summary>
    public Boolean removeListing(int k)
    {
        for (int i = 0; i < listings.Length; i++)
        {
            if (listings[i] == getListing(k))
            {
                listings[i] = null;
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// removes item from listings
    /// returns false if item is not in listings
    /// </summary>
    public Boolean removeListing(long k)
    {
        for (int i = 0; i < listings.Length; i++)
        {
            if (listings[i] == getListing(k))
            {
                listings[i] = null;
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// return the item from items where index=val
    /// </summary>
    public Item getItem(int val)
    {
        return items[val];
    }

    /// <summary>
    /// returns the item from items where name=val
    /// can return null
    /// </summary>
    public Item getItem(String val)
    {
        foreach (Item i in items)
        {
            if (i.Name == val)
            {
                return i;
            }
        }
        return null;
    }

    /// <summary>
    /// returns the item from items where key=val
    /// make sure input val is a long or it will seach for index instead of key
    /// can return null
    /// </summary>
    public Item getItem(long val)
    {
        foreach (Item i in items)
        {
            if (i.Key == val)
            {
                return i;
            }
        }
        return null;
    }

    /// <summary>
    /// adds new item to items array
    /// returns false if array is full
    /// </summary>
    public Boolean addItem(Item add)
    {
        for (int i = 0; i < items.Length; i++)
        {
            if (items[i] == null)
            {
                items[i] = add;
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// removes item from items
    /// returns false if item is not in items
    /// </summary>
    public Boolean removeItem(String k)
    {
        for (int i = 0; i < items.Length; i++)
        {
            if (items[i] == getItem(k))
            {
                items[i] = null;
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// removes item from items
    /// returns false if item is not in items
    /// </summary>
    public Boolean removeItem(int k)
    {
        for (int i = 0; i < items.Length; i++)
        {
            if (items[i] == getItem(k))
            {
                items[i] = null;
                return true;
            }
        }
        return false;
    }

    /// <summary>
    /// removes item from items
    /// returns false if item is not in items
    /// </summary>
    public Boolean removeItem(long k)
    {
        for (int i = 0; i < items.Length; i++)
        {
            if (items[i] == getItem(k))
            {
                items[i] = null;
                return true;
            }
        }
        return false;
    }
}
