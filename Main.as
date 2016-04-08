package
{
	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;
	import flash.media.*;


	public class Main extends MovieClip
	{
		private var score: Number;
		private var speed: Number;
		private var pipes: Array;
		private var gotoWin, gotoLose, playerClicked: Boolean;
		var my_sound: SoundId = new SoundId();

		var my_sound2: SoundId2 = new SoundId2();

		var my_sound3: SoundId3 = new SoundId3();





		public function Main()
		{


		}

		//All Start Functions
		public function startMenu()
		{
			stop();
			btnStartGame.addEventListener(MouseEvent.CLICK, gotoStartGame);

		}
		public function StartMenu2()
		{
			stop();
			btnStartGame.addEventListener(MouseEvent.CLICK, gotoStartGame2);
			removeEventListener(Event.ENTER_FRAME, update);
			removeEventListener(MouseEvent.CLICK, clicked);
			trace("kast");



		}

		public function startWin()
		{
			btnBack.addEventListener(MouseEvent.CLICK, gotoMenu);
		}


		public function startLose()
		{
			btnBack.addEventListener(MouseEvent.CLICK, gotoMenu);
		}

		public function startGame()
		{
			mcPlayer.gotoAndPlay("right");
			score = 0;
			speed = 0;



			gotoWin = false;
			gotoLose = false;
			playerClicked = false;

			pipes = new Array("pipe1a", "pipe1b", "pipe2a", "pipe2b", "pipe3a", "pipe3b",
				"pipe4a", "pipe4b", "pipe5a", "pipe5b", "pipe6a", "pipe6b",
				"pipe7a", "pipe7b", "pipe8a", "pipe8b");

			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(MouseEvent.CLICK, clicked);

			stage.focus = this;
			trace("IPAOBDW");



		}

		public function StartGame2()
		{
			removeEventListener(Event.ENTER_FRAME, update);
			removeEventListener(MouseEvent.CLICK, clicked);
			mcPlayer.gotoAndPlay("right");
			score = 10;
			speed = 0;



			gotoWin = false;
			gotoLose = false;
			playerClicked = false;

			pipes = new Array("pipe1a", "pipe1b", "pipe2a", "pipe2b", "pipe3a", "pipe3b",
				"pipe4a", "pipe4b", "pipe5a", "pipe5b", "pipe6a", "pipe6b",
				"pipe7a", "pipe7b", "pipe8a", "pipe8b");

			addEventListener(Event.ENTER_FRAME, update2);


			stage.focus = this;
			trace("IPAOBDW");



		}


		private function gotoStartGame(evt: MouseEvent)
		{
			btnStartGame.removeEventListener(MouseEvent.CLICK, gotoStartGame);
			gotoAndStop("game");
			trace("Ron");
		}
		private function gotoStartGame2(evt: MouseEvent)
		{
			btnStartGame.removeEventListener(MouseEvent.CLICK, gotoStartGame2);
			gotoAndStop("game2");

			trace("Ron");
		}



		private function gotoMenu(evt: MouseEvent)
		{
			btnBack.removeEventListener(MouseEvent.CLICK, gotoMenu);
			gotoAndStop("menu");
			trace("peter");
		}


		private function clicked(evt: MouseEvent)
		{

			playerClicked = true;
		}

		public function update(evt: Event)
		{
			handleUserInput();
			handleGameLogic();
			handleDraw();

			if (gotoWin)
				triggerGoToWin();
			else if (gotoLose)
				triggerGoToLose();
		}
		public function update2(evt: Event)
		{
			handleUserInput2();
			handleGameLogic2();
			handleDraw2();

			if (gotoWin)
				triggerGoToWin();
			else if (gotoLose)
				triggerGoToLose();
		}

		private function handleUserInput()
		{

			if (playerClicked == true)
			{

				var channel: SoundChannel = my_sound.play();
				//my_sound.play();
				speed = -14;

				playerClicked = false;
			}
		}
		private function handleUserInput2()
		{

			if (playerClicked == true)
			{

				my_sound.play();
				speed = -10;

				playerClicked = false;
			}
		}






		private function handleGameLogic()
		{

			mcPlayer.y += speed;


			speed += 1.4;

			if (mcPlayer.y <= 0)
			{
				gotoLose = true;
			}
			else if (mcPlayer.y >= 600)
			{
				gotoLose = true;
			}


			for (var i in pipes)
			{
				var currPipeName = pipes[i];
				var currPipe = this[currPipeName];


				currPipe.x -= 20;


				if (currPipe.hitTestPoint(mcPlayer.x, mcPlayer.y))
				{
					gotoLose = true;
				}


				if (currPipe.visible && currPipe.x <= 0)
				{
					score += 0.5;
					currPipe.visible = false;
				}
			}


			if (score >= 8)
			{
				gotoAndStop("Menu2");
			}
			if (score == 18)
			{
				gotoWin = true;
			}

		}
		private function handleGameLogic2()
		{
			trace(mcPlayer);
			trace(speed);
			mcPlayer.y += speed;


			speed += 1.2;

			if (mcPlayer.y <= 0)
			{
				gotoAndStop("Menu2")
			}
			else if (mcPlayer.y >= 600)
			{
				gotoAndStop("Menu2")
			}


			for (var i in pipes)
			{
				var currPipeName = pipes[i];
				var currPipe = this[currPipeName];


				currPipe.x -= 35;


				if (currPipe.hitTestPoint(mcPlayer.x, mcPlayer.y))
				{
					gotoAndStop("Menu2");
				}


				if (currPipe.visible && currPipe.x <= 0)
				{
					score += 0.5;
					currPipe.visible = false;
				}

				if (score == 18)
				{
					gotoWin = true;
				}


			}
		}




		private function handleDraw()
		{

			trace(txtScore);
			trace(score);
			txtScore.text = String(score);

		}
		private function handleDraw2()
		{

			txtScore.text = String(score);
		}



		private function triggerGoToWin()
		{
			removeEventListener(Event.ENTER_FRAME, update);
			removeEventListener(Event.ENTER_FRAME, update2);
			gotoAndStop("winnen");
			var channel3: SoundChannel = my_sound3.play();
		}

		private function triggerGoToLose()
		{
			removeEventListener(Event.ENTER_FRAME, update);
			removeEventListener(Event.ENTER_FRAME, update2);
			gotoAndStop("lose");
			var channel2: SoundChannel = my_sound2.play();

			//my_sound2.play();
		}

	}
}