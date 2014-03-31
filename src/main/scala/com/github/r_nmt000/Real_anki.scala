package com.github.r_nmt000
import scala.io.Source
import java.io.File
import scala.xml._    

object Real_anki {
    def extractElements(it:Iterator[Node], tag:String):Node = {
	var itRet:Node = null.asInstanceOf[Node]
	while(it.hasNext){
	    it.next.text match{
		case `tag` => itRet = it.next
		case _     => 
	    }
	}
	return itRet

    }
    
    def mergeAllElements(eTitles:Iterator[Node],jTitles:Iterator[Node],eAudio:Iterator[Node],eConv1:Iterator[Node],eConv2:Iterator[Node],eConv3:Iterator[Node],jConv1:Iterator[Node],jConv2:Iterator[Node],jConv3:Iterator[Node],eSound1:Iterator[Node],eSound2:Iterator[Node],eSound3:Iterator[Node],comments:Iterator[Node]):String = {
	val stringBuilder = new StringBuilder
	while(eTitles.hasNext){
	    val temp = "\"" + eTitles.next.text + "\"" + ";" + "\"" + jTitles.next.text + "\"" + ";" + "[sound:" + eAudio.next.text.replace("caf","mp3") + "]"+ ";" + "\"" +  eConv1.next.text.replaceAll("\"","\"\"") + "\"" + ";" + "\"" + eConv2.next.text.replaceAll("\"","\"\"") + "\"" + ";" + "\"" + eConv3.next.text.replaceAll("\"","\"\"") + "\"" + ";" + "\"" + jConv1.next.text.replaceAll("\"","\"\"") + "\"" + ";" + "\"" + jConv2.next.text.replaceAll("\"","\"\"") + "\"" + ";" + "\"" + jConv3.next.text.replaceAll("\"","\"\"") + "\"" + ";" + "[sound:" + eSound1.next.text.replace("caf","mp3") +"]" + ";" + "[sound:" + eSound2.next.text.replace("caf","mp3") + "]" + ";" + "[sound:" +  eSound3.next.text.replace("caf","mp3") + "]" + ";" + "\"" + comments.next.text.replaceAll("\"","\"\"") + "\""  +"\n"
	    stringBuilder ++= temp
	}
	stringBuilder.toString
    }
    
    def main(args : Array[String]) {
	println("start")
	val input = "UserPhraseDictionary.plist" 
	val output = readLine("output file name>")
	val plist = XML.loadFile( new File(input) )
	val title = (plist \ "dict" \ "key").text
	val eachPhrase = (plist \ "dict" \  "dict" )
	println(eachPhrase.size)
	var eTitles = new NodeBuffer
	var jTitles = new NodeBuffer
	var eAudio = new NodeBuffer
	var eConv1 = new NodeBuffer
	var eConv2 = new NodeBuffer
	var eConv3 = new NodeBuffer
	var jConv1 = new NodeBuffer
	var jConv2 = new NodeBuffer
	var jConv3 = new NodeBuffer	
	var eSound1 = new NodeBuffer
	var eSound2 = new NodeBuffer
	var eSound3 = new NodeBuffer
	var comments = new NodeBuffer
	eachPhrase.foreach(n => eTitles+=extractElements(n.child.iterator,"title_eng"))
	eachPhrase.foreach(n => jTitles+=extractElements(n.child.iterator,"title_jp"))
	eachPhrase.foreach(n => eAudio+=extractElements(n.child.iterator,"title_audio"))
	eachPhrase.foreach(n => comments+=extractElements(n.child.iterator,"comments"))	
 	eachPhrase.foreach(n => for(i <- 1 to 3) {
	    i match{
		case 1 => eConv1 += extractElements((n \ "array" \ "dict")(0).child.iterator,"eng")
		case 2 => eConv2 += extractElements((n \ "array" \ "dict")(1).child.iterator,"eng")
		case 3 => if ((n \ "array" \ "dict").size == 3){ eConv3 += extractElements((n \ "array" \ "dict")(2).child.iterator,"eng")}
			  else eConv3 += Elem(null, "test", scala.xml.Null , scala.xml.TopScope)
		case _ =>
	    }
	})
 	eachPhrase.foreach(n => for(i <- 1 to 3) {
	    i match{
		case 1 => jConv1 += extractElements((n \ "array" \ "dict")(0).child.iterator,"jp")
		case 2 => jConv2 += extractElements((n \ "array" \ "dict")(1).child.iterator,"jp")
		case 3 => if ((n \ "array" \ "dict").size == 3){ jConv3 += extractElements((n \ "array" \ "dict")(2).child.iterator,"jp")}
			  else jConv3 += Elem(null, "test", scala.xml.Null , scala.xml.TopScope)
		case _ =>
	    }
	})
 	eachPhrase.foreach(n => for(i <- 1 to 3) {
	    i match{
		case 1 => eSound1 += extractElements((n \ "array" \ "dict")(0).child.iterator,"audio")
		case 2 => eSound2 += extractElements((n \ "array" \ "dict")(1).child.iterator,"audio")
		case 3 => if ((n \ "array" \ "dict").size == 3){ eSound3 += extractElements((n \ "array" \ "dict")(2).child.iterator,"audio")}
			  else eSound3 += Elem(null, "test", scala.xml.Null , scala.xml.TopScope)
		case _ =>
	    }
	})
	    val scripts = mergeAllElements(eTitles.iterator,jTitles.iterator, eAudio.iterator, eConv1.iterator, eConv2.iterator, eConv3.iterator, jConv1.iterator, jConv2.iterator, jConv3.iterator, eSound1.iterator, eSound2.iterator, eSound3.iterator, comments.iterator)
	import java.io.PrintWriter
	val out = new PrintWriter(output)
	scripts.foreach(out.print(_))
	out.close
    }  
}

