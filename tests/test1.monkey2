
' Make sure you build this as the "Console" type
' Ted2Go does not register any of this
' So you'll need to run this from your 'products' folder

#Import "<std>"
Using std..

#Import "../m2libcext"
Using m2libcext..

Function Main()
	
	' NOTICE
	Print "Most of these functions will NOT work in Ted2Go"
	Print "Make sure you're running this via your 'products' folder~n"
	
	Console.Write("Checking color support...")
	' Check if colors are supported
	If Console.SupportsColor Then
		Console.Negative() ' Swaps foreground and background colors
		Print "Yay, you can see the colors!"
		Console.Positive() ' Returns foreground/background to normal
	Else
		Print "Aww, this console window doesn't support colors"
		#If __TARGET__="windows"
			Print "Make sure you're not in a ~qLegacy Mode~q console"
			Print "And that you've also updated Windows 10"
		#End
	Endif
	
	Print "~nHello!"
	
	' Change the foreground and background color
	Console.Foreground=Console.Color.Red
	Console.Background=Console.Color.Black
	
	' Ask user for input
	Local usrInput:String
	While usrInput.Length<=0
		
		'Write does not append a new line at the end
		Console.Write("Write something> ")
		
		' Input in bold colors
		Console.ForegroundBold=True
		usrInput=Console.Input()
		Console.ForegroundBold=False
	Wend
	
	' Change the foreground and background color
	Console.Foreground=Console.Color.Blue
	Console.Background=Console.Color.Yellow
	
	' Display whatever the user previously input
	Console.Write("You wrote: ")
	
	' In bold colors
	Console.ForegroundBold=True
	Console.Write(usrInput, True) 'With new line
	Console.ForegroundBold=False
	
	Sleep(0.5)
	
	' Reset colors (and bold)
	Console.ResetColors()
	
	' Add underline
	Console.ForegroundUnderline=True
	
	'Make a bell sound
	Console.Bell() 
	
	'Wait for the user to press return
	
	Console.WaitKey() 
	' Reset colors (and underline)
	Console.ResetColors()
	
	Console.Write("Bye!")
	Sleep(1)
End