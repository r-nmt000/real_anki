import sbt._
import sbt.Keys._

object Real_ankiBuild extends Build {

  lazy val real_anki = Project(
    id = "real_anki",
    base = file("."),
    settings = Project.defaultSettings ++ Seq(
      name := "real_anki",
      organization := "com.github.r_nmt000",
      version := "0.1-SNAPSHOT",
      scalaVersion := "2.9.2"
      // add other settings here
    )
  )
}
