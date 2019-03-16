import Dependencies._

ThisBuild / scalaVersion     := "2.12.8"
ThisBuild / version          := "0.1.0-SNAPSHOT"
ThisBuild / organization     := "kamiyaowl.chisel-practice"
ThisBuild / organizationName := "kamiyaowl"

lazy val root = (project in file("."))
  .settings(
    name := "chisel-practice",
    libraryDependencies += scalaTest % Test
  )

scalacOptions ++= Seq("-deprecation", "-feature", "-unchecked", "-language:reflectiveCalls")

val chiselGroupId = "edu.berkeley.cs"
libraryDependencies ++= Seq(
  chiselGroupId %% "chisel3" % "3.0.+",
  chiselGroupId %% "chisel-iotesters" % "1.1.+"
)
resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases")
)
// See https://www.scala-sbt.org/1.x/docs/Using-Sonatype.html for instructions on how to publish to Sonatype.
