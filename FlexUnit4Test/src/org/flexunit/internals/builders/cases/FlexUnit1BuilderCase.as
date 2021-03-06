/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.flexunit.internals.builders.cases
{
	import flex.lang.reflect.Klass;
	
	import flexunit.framework.TestCase;
	
	import org.flexunit.Assert;
	import org.flexunit.internals.builders.FlexUnit1Builder;
	import org.flexunit.internals.builders.definitions.FlexUnit1Class;
	import org.flexunit.internals.runners.FlexUnit1ClassRunner;
	
	public class FlexUnit1BuilderCase extends FlexUnit1Builder
	{		
		protected var t1 : FlexUnit1Class;

		[Test(description="Ensure the runner can handle a real FU1 class")]
		public function canHandleClassRight() : void {
			Assert.assertTrue( canHandleClass( FlexUnit1Class ) );
		}

		[Test(description="Ensure the runner doesn't handle a non FU1 class")]
		public function canHandleClassWrong() : void {
			Assert.assertFalse( canHandleClass( Object ) );
		}

		[Test(description="Ensure a FlexUnit1ClassRunner is returned if a FU1 class is passed")]
		public function testRunnerForClassClass() : void {
			Assert.assertTrue( runnerForClass( FlexUnit1Class ) is FlexUnit1ClassRunner );
		}
		
		[Ignore("Need to rework this test")]
		[Test(description="Ensure if a FlexUnit1 Class is not passed that the runner returns null")]
		public function testRunnerForClassNull(): void {
			Assert.assertNull( runnerForClass( Object ) ); 
		}
		
		[Test(description="Ensure that isPre4Test returns true in the case we have a pre FU4 test")]
		public function testIsPre4TestTrue() : void {
			Assert.assertTrue( isPre4Test( new Klass( FlexUnit1Class ) ) );
		}
		
		[Test(description="Ensure that if a pre FU4 test is not passed, that we recieve a false")]
		public function testIsPre4TestFalse() : void {
			Assert.assertFalse( isPre4Test( new Klass( Object ) ) );
		}
	}
	
	
}

