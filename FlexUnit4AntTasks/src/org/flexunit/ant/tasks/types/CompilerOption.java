package org.flexunit.ant.tasks.types;

import org.apache.tools.ant.BuildException;

public class CompilerOption
{
	public static final String NO_OPTION = "";
	
	String option;
	
	public CompilerOption()
	{
		option = NO_OPTION;
	}

    public void setOption(String option)
    {
    	this.option = option.substring(0, 1).matches("-") ? option : "-" + option;
    }
    
    public String getOption()
    {
    	return option;
    }
    
    public void validate() throws BuildException
    {
       if(getOption() == NO_OPTION) {
    	   throw new BuildException("One of the compiler option specified has no 'option' set.");
       }
    }
}