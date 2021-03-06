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
package tests.org.flexunit.events.cases {
	import flash.events.Event;
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertStrictlyEquals;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.events.AsyncEvent;

	public class AsyncEventCase {
		
		[Test]
		public function shouldStoreOriginalEvent():void {
			var originalEvent:Event = new Event("originalEvent")
			var asyncEvent:AsyncEvent = new AsyncEvent("async", false, false, originalEvent);

			assertStrictlyEquals( originalEvent, asyncEvent.originalEvent );
		}

		[Test]
		public function shouldStoreTypeCorrectly():void {
			var asyncEvent:AsyncEvent = new AsyncEvent("async", false, false, null );
			assertEquals( "async", asyncEvent.type );
		}

		[Test(expects="flexunit.framework.AssertionFailedError")]
		public function shouldFailWithIncorrectType():void {
			var asyncEvent:AsyncEvent = new AsyncEvent("async1", false, false, null );
			assertEquals( "async", asyncEvent.type );
		}

		[Test]
		public function shouldPassParamsCorrectlyToSuperClass():void {
			var asyncEvent1:AsyncEvent = new AsyncEvent("async", false, false, null );
			
			assertFalse( asyncEvent1.bubbles );
			assertFalse( asyncEvent1.cancelable );

			var asyncEvent2:AsyncEvent = new AsyncEvent("async", true, true, null );
			
			assertTrue( asyncEvent2.bubbles );
			assertTrue( asyncEvent2.cancelable );
		}

		[Test(description="Ensure the AsyncEvent is successfully cloned")]
		public function shouldBeAbleToCloneEvent():void {
			var originalEvent:Event = new Event("originalEvent")
			var asyncEvent1:AsyncEvent = new AsyncEvent("async", true, false, originalEvent );
			var newAsyncEvent1:AsyncEvent = asyncEvent1.clone() as AsyncEvent;
			
			assertStrictlyEquals( originalEvent, newAsyncEvent1.originalEvent);
			assertEquals( asyncEvent1.bubbles, newAsyncEvent1.bubbles );
			assertEquals( asyncEvent1.cancelable, newAsyncEvent1.cancelable );
			assertEquals( asyncEvent1.type, newAsyncEvent1.type );

			var asyncEvent2:AsyncEvent = new AsyncEvent("async", false, true, originalEvent );
			var newAsyncEvent2:AsyncEvent = asyncEvent2.clone() as AsyncEvent;
			
			assertStrictlyEquals( originalEvent, newAsyncEvent2.originalEvent);
			assertEquals( asyncEvent2.bubbles, newAsyncEvent2.bubbles );
			assertEquals( asyncEvent2.cancelable, newAsyncEvent2.cancelable );
			assertEquals( asyncEvent2.type, newAsyncEvent2.type );
			
		}
	}
}