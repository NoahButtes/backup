/   օ�á9Y      create_object.html <!DOCTYPE html> <html> <head> <title>Create Object</title> <link rel=stylesheet type=text/css href=http://cdn.goonhub.com/css/style.css> </head> <body id=createobj> <form name=spawner action="byond://?src=/* ref src */" method=get> <input type=hidden name=src value="/* ref src */"> <input type=hidden name=action value=object_list> Type <input type=text name=filter style=width:280px onkeydown=submitFirst(event)><input type=button name=search value=Search onclick=updateSearch() style=width:70px><br> Offset: <input type=text name=offset value=x,y,z style=width:250px> A <input type=radio name=offset_type value=absolute> R <input type=radio name=offset_type value=relative checked><br> Direction: S<input type=radio name=one_direction value=2 checked> SE<input type=radio name=one_direction value=6> E<input type=radio name=one_direction value=4> NE<input type=radio name=one_direction value=5> N<input type=radio name=one_direction value=1> NW<input type=radio name=one_direction value=9> W<input type=radio name=one_direction value=8> SW<input type=radio name=one_direction value=10><br> Number: <input type=text name=object_count value=1 style=width:330px> <br><br> <div id=selector_hs> <select name=type id=object_list multiple size=20> </select> </div> <br> <input type=submit value=spawn> </form> <script language=JavaScript> var old_search = "";
		var object_list = document.spawner.object_list;
		var object_list_container = document.getElementById('selector_hs');
		var object_paths = null /* object types */;
		var objects = object_paths == null ? new Array() : object_paths.split(";");
		
		document.spawner.filter.focus();
		populateList(objects);
		
		function populateList(from_list)
		{
			var newOpts = '';
			var i;
			for (i in from_list)
			{
				newOpts += '<option value="' + from_list[i] + '">'
					+ from_list[i] + '</option>';
			}
			object_list_container.innerHTML = '<select name="type" id="object_list" multiple size="20">' + 
			newOpts + '</select>';
		}
		
		function updateSearch()
		{
			if (old_search == document.spawner.filter.value)
			{
				return false;
			}
			
			old_search = document.spawner.filter.value;
			
			
			var filtered = new Array();
			var i;
			for (i in objects)
			{
				if(objects[i].search(old_search) < 0)
				{
					continue;
				}
				
				filtered.push(objects[i]);
			}
			
			populateList(filtered);
			
			if (object_list.options.length)
				object_list.options[0].selected = 'true';
			
			return true;
		}
		
		function submitFirst(event)
		{
			if (event.keyCode == 13 || event.which == 13)
			{
				if (updateSearch())
				{
					if (event.stopPropagation) event.stopPropagation();
					else event.cancelBubble = true;

					if (event.preventDefault) event.preventDefault();
					else event.returnValue = false;
				}
			}
		} </script> </body> </html>*    ǡp�9Y       parser.html Go away nerd.:   ����9Y      tooltip.html <!DOCTYPE html> <html> <head> <title>Tooltip</title> <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1"> <meta http-equiv=Content-Type content="text/html; charset=UTF-8"> <link rel=stylesheet type=text/css href=http://cdn.goonhub.com/css/font-awesome.css> <link rel=stylesheet type=text/css href=http://cdn.goonhub.com/css/tooltip.css> </head> <body> <div id=wrap class=wrap> <div id=content class=content></div> <a href=# class=close-tip style="display: none"><i class=icon-remove></i></a> </div> <script type=text/javascript src=http://cdn.goonhub.com/js/jquery.min.js></script> <script type=text/javascript src=http://cdn.goonhub.com/js/jquery.waitForImages.js></script> <script type=text/javascript src=http://cdn.goonhub.com/js/errorHandler.js></script> <script type=text/javascript src=http://cdn.goonhub.com/js/animatePopup.js></script> <script type=text/javascript> var tooltipRef = 'TOOLTIPREFPLACE';
		var tooltipDebug = false; </script> <script type=text/javascript src=http://cdn.goonhub.com/js/tooltip.js></script> </body> </html>J    .���9Y    3   .html {"error":"You don't have access to this resource."}�   �"�9Y    �  browserOutput.html <!DOCTYPE html> <html> <head> <title>Chat</title> <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1"> <meta http-equiv=Content-Type content="text/html; charset=UTF-8"> <link rel=stylesheet type=text/css href=http://cdn.goonhub.com/css/font-awesome.css> <link rel=stylesheet type=text/css href=http://cdn.goonhub.com/css/browserOutput.css> <script type=text/javascript src=http://cdn.goonhub.com/js/jquery.min.js></script> <!-- <script type="text/javascript" src="http://cdn.goonhub.com/js/array.generics.min.js"></script> --> </head> <body> <div id=loading> <i class="icon-spinner icon-2x"></i> <div> Loading...<br><br> If this takes longer than 30 seconds, it will automatically reload a maximum of 5 times.<br> If it STILL doesn't work, please post a report here: <a href="https://forum.ss13.co/viewforum.php?f=7">https://forum.ss13.co/viewforum.php?f=7</a> </div> </div> <div id=messages> </div> <div id=userBar style="display: none"> <div id=ping> <i class=icon-circle id=pingDot></i> <span class=ms id=pingMs>--ms</span> </div> <div id=options> <a href=# class=toggle id=toggleOptions title=Options><i class=icon-cog></i></a> <div class=sub id=subOptions> <a href=# class=decreaseFont id=decreaseFont><span>Decrease font size</span> <i class=icon-font>-</i></a> <a href=# class=increaseFont id=increaseFont><span>Increase font size</span> <i class=icon-font>+</i></a> <a href=# class=chooseFont id=chooseFont>Change font <i class=icon-font></i></a> <a href=# class=togglePing id=togglePing><span>Toggle ping display</span> <i class=icon-circle></i></a> <a href=# class=highlightTerm id=highlightTerm><span>Highlight string</span> <i class=icon-tag></i></a> <a href=# class=saveLog id=saveLog><span>Save chat log</span> <i class=icon-save></i></a> <a href=# class=clearMessages id=clearMessages><span>Clear all messages</span> <i class=icon-eraser></i></a> </div> </div> </div> <audio id=play-music class=hidden autoplay></audio> <script type=text/javascript src=http://cdn.goonhub.com/js/errorHandler.js></script> <!-- <script type="text/javascript" src="http://cdn.goonhub.com/js/anchorme.js"></script> --> <script type=text/javascript src=http://cdn.goonhub.com/js/browserOutput.js></script> </body> </html>�   P�A�9Y    �  changelog.html <style type=text/css> .postcard {display: block; margin: 10px auto; width: 300px;}
	h1 {font-size: 2.5em; padding: 0 10px; margin: 0; color: #115FD5;}
	h1 a {display: block; float: right;}
	.links {list-style-type: none; margin: 15px 5px; padding: 0; border: 1px solid #ccc; color: #333;}
	.links li {float: left; width: 50%; text-align: center; background: #f9f9f9; padding: 10px 0; position: relative;}
	.links li span {position: absolute; top: 0; right: 0; bottom: 0; width: 1px; background: #ccc;}

	.log {list-style-type: none; padding: 0; background: #f9f9f9; margin: 20px 5px; border: 1px solid #ccc; font-size: 1em; color: #333;}
	.log li {padding: 5px 5px 5px 20px; border-top: 1px solid #ccc; line-height: 1.4}
	.log li.title {background: #efefef; font-size: 1.7em; color: #115FD5; padding: 10px 10px; border-top: 0;}
	.log li.date {background: #f1f1f1; font-size: 1.1em; font-weight: bold; padding: 8px 5px; border-bottom: 2px solid #bbb;}
	.log li.admin {font-size: 1.2em; padding: 5px 5px 5px 10px;}
	.log li.admin span {color: #2A76E7;}

	h3 {padding: 0 10px; margin: 0; color: #115FD5;}
	.team, .lic {padding: 10px; margin: 0; line-height: 1.4;}
	.lic {font-size: 0.9em;} </style> <!-- HTML GOES HERE -->�    { �9Y    i   powmonkey.txt general
	key = "Powmonkey"
	ckey = "powmonkey"
	gender = "male"
	joined = "2011-07-08"
	online = 1
6   v�ϟ�CY    $    DDMI   �  snackcake @����� �B 6   h�ۯ�CY    $    DDMI   �  snackcake @���3� �B 6   v����CY    $    DDMI   �  snackcake @���  ��B 6   ��B�CY    $    DDMI   �  snackcake @���ۡ(�B 6   >��Q�CY    $    DDMI   �  snackcake @���� f�B 4   3\O��CY    "    DDMI   )	  wanted-unknown @���3   �B��CY    !    DDMI   T	  precursor-2fx @���6   xL��CY    $    DDMI   �   seeds-ovl @���   �B 6   r}��CY    $    DDMI   �   seeds-ovl @�������B �   ߟ9�	DY    o    DDMIg   d  �  eyebot-logout @   BJ  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?V  static @���B'   ��YDY        DDMI   �  ����B �   �#K'DY    �    DDMI�   X   body_m @���   �B w   No Underwear @�������BBd  N   blank @   BBJ  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?V  static @���B3   <'DY    !    DDMI   �  ice100 @�������B 3   ���'DY    !    DDMI   �  ice100 @����33�B 3   �X��'DY    !    DDMI   �  ice100 @�����B 3   P�'DY    !    DDMI   �  ice100 @����(��B 3   ƴ��'DY    !    DDMI   �  ice100 @���   �B 3   ��·'DY    !    DDMI   �  ice100 @����� �B 3   ����'DY    !    DDMI   �  ice100 @�������B 3   L��C'DY    !    DDMI   �  ice100 @���'�B 3   �qC�'DY    !    DDMI   �  ice100 @����� �B 3   ե��'DY    !    DDMI   �  ice100 @�������B 3   ��j'DY    !    DDMI   �  ice100 @�������B 1   gx�(DY        DDMI   �  butt @���   �B �   wD�(DY    �    DDMI}   		  head @���   �B Y   eyes @����BBY   short @����BBY   tramp @����BBY   none @����BBM   (��F(DY    ;    DDMI3   �  chest_m @���   �B �  chest_blood @���B3   x�aUDY    !    DDMI   T	  precursor-5fx @����   O9�UDY    �    DDMI|   		  head @���   �B Y   eyes @����BBY   short @����BBY   none @����BBY   none @����BB�   �H��UDY    �    DDMI{   		  head @���   �B Y   eyes @����BBY   pomp @�����F�BBY   none @����BBY   none @����BB�   ӭ?UDY    �    DDMI�   X   body_f @���   �B w   No Underwear @�������BBd  N   blank @   BBJ  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?V  static @���B,   2�^WDY        DDMI   		  monkey @���;   �2;WDY    )    DDMI!   d  �  eyebot-logout @   B3   A��WDY    !    DDMI   d  N   blank @   B�   ����XDY    �    DDMI�   X   body_m @���   �B Y   eyes @����BY   short @����BBY   none @����BBY   none @����BBw   none @�������BBB-   �R�#XDY        DDMI   n   preview @���m   y���XDY    K  adminOutput.html <div id=contextMenu class=contextMenu style="display: none"> <a href=# id=ctx_pm>Admin PM</a> <a href=# id=ctx_smsg>Subtle Msg</a> <a href=# id=ctx_jump>Jump To</a> <a href=# id=ctx_get>Get</a> <a href=# id=ctx_boot>Boot</a> <a href=# id=ctx_ban>Ban</a> <a href=# id=ctx_gib>Gib</a> <a href=# id=ctx_popt>Player Options</a> <a href=# id=ctx_observe>Observe</a> <a href=# id=ctx_ghostjump>Teleport To</a> </div> <script type=text/javascript> /* DO NOT USE LINE COMMENTS (//) IN THIS FILE FOR THE LOVE OF GOD */

opts.menuTypes = { /* Action flags for context menu */
	1:  'pm',
	2:  'smsg',
	4:  'boot',
	8:  'ban',
	16: 'gib',
	32: 'popt',
	64: 'jump',
	128: 'get',
	512: 'ghostjump',
};
opts.contextMenuTarget = null; /* Contains the player mind ref */
opts.showMessagesFilters = { /* Contains the current filters. "show: false" filters it out. "match" is all the css classes to filter on. */
	'All': {show: true},
	'Admin': {show: true, match: ['admin']},
	'Combat': {show: true, match: ['combat']},
	'Radios': {show: true, match: ['radio']},
	'Speech': {show: true, match: ['say']},
	'OOC': {show: true, match: ['ooc']},
	'Misc': {show: true},
};
opts.filterHideAll = false;

$contextMenu = $('#contextMenu');
$subOptions.append('<a href="#" class="filterMessagesOpt" id="filterMessagesOpt"><span>Filter Messages</span> <i class="icon-filter"></i></a>');

function openContextMenu(flags, target, x, y) {
	for (var i in opts.menuTypes) {
		$('#ctx_' + opts.menuTypes[i])[(flags & i) === 0 ? 'hide' : 'show']();
	}
	
	$contextMenu.hide(0, function() {
		if (($contextMenu.height() + y) > ($(window).height() - 16)) {
			y -= $contextMenu.height() + 4;
		}
		$contextMenu.css({top: y + 2, left: x + 2});
		$contextMenu.slideDown(200);
	});

	opts.contextMenuTarget = target;
}

function hideContextMenu() {
	$contextMenu.slideUp(200);
	opts.contextMenuTarget = null;
}

function toggleFilter(type) {
	if (type == 'All') {
		if (opts.showMessagesFilters['All'].show === true) {
			$.each(opts.showMessagesFilters, function(key) {
				opts.showMessagesFilters[key].show = false;
				if (key != 'All') {
					$('#filter_'+key).prop('checked', false);
				}
			});
			$('#messages .entry *:nth-child(1):not(.internal)').parent('.entry').addClass('hidden').attr('data-filter', 'All');
			opts.filterHideAll = true;
			output('<span class="internal boldnshit">Hiding <strong>ALL</strong> messages. Uhhh are you sure about this?</span>');
		} else {
			$.each(opts.showMessagesFilters, function(key) {
				opts.showMessagesFilters[key].show = true;
				if (key != 'All') {
					$('#filter_'+key).prop('checked', true);
				}
			});
			$('#messages .entry.hidden[data-filter]').removeClass('hidden');
			opts.filterHideAll = false;
			output('<span class="internal boldnshit">Showing <strong>ALL</strong> messages</span>');
		}
	} else {
		var onoff = !opts.showMessagesFilters[type].show;
		opts.showMessagesFilters[type].show = onoff;
		var allTrue = true;
		var allFalse = true;
		$.each(opts.showMessagesFilters, function(key, val) {
			if (key != 'All') {
				if (allTrue)
					allTrue = (val.show ? true : false);
				if (allFalse)
					allFalse = (val.show ? false : true);
			}
		});
		opts.showMessagesFilters['All'].show = (allTrue ? true : false);
		$('#filter_All').prop('checked', (allTrue ? true : false));

		if (allTrue) {
			opts.filterHideAll = false;
			$('#messages .entry.hidden[data-filter]').removeClass('hidden');
		} else if (allFalse) {
			opts.filterHideAll = true;
			$('#messages .entry *:nth-child(1):not(.internal)').each(function(i, el) {
				$(el).parent('.entry').addClass('hidden').attr('data-filter', 'All');
			});
		} else if (typeof opts.showMessagesFilters[type].match != 'undefined') { /* If the filter has classes to match against */
			/* Hide/Show all prior messages */
			for (var i = 0; i < opts.showMessagesFilters[type].match.length; i++) {
				var thisClass = opts.showMessagesFilters[type].match[i];
				if (onoff) { /* showing */
					$('#messages .entry.hidden[data-filter="'+type+'"]').removeClass('hidden');
				} else { /* hiding */
					$('#messages .'+thisClass).each(function(i, el) {
						$(el).closest('.entry').addClass('hidden').attr('data-filter', type);
					});
				}
			}
		} else if (type == 'Misc') {
			if (onoff) {
				$('#messages .entry.hidden[data-filter="Misc"]').removeClass('hidden');
			} else {
				$('#messages .entry *:nth-child(1):not([class]), #messages .entry:not(:has(>*))').each(function(i, el) {
					$(el).parent('.entry').addClass('hidden').attr('data-filter', 'Misc');
				});
			}
		}

		var msg = (onoff ? 'Showing' : 'Filtering <strong>OUT</strong>') + ' messages of type <strong>'+type+'</strong>';
		output('<span class="internal boldnshit">'+msg+'</span>');
	}
	console.log('filters is: ', opts.showMessagesFilters);
}

$contextMenu.on('mousedown', function(e) {
	e.preventDefault();
	var target = $(e.target);
	var id = target.attr('id');
	if (!id) {
		output('<span class="internal boldnshit">Failed to retrieve context menu command data. Report this bug.</span>');
	} else {
		var command = target.attr('id').substring(4);
		runByond('byond://?action=ehjax&type=datum&datum=chatOutput&proc=handleContextMenu&param[command]=' + command + '&param[target]=' + opts.contextMenuTarget);
	}
});

$messages.on('contextmenu', '.adminHearing .name', function(e) {
	var $this = $(this);
	var mind = $this.attr('data-ctx');
	var flags = $this.closest('.adminHearing').attr('data-ctx');
	if (mind && flags) {
		openContextMenu(flags, mind, e.clientX, e.clientY);
		return false;
	}
	else {
		if (!mind && !flags) {
			output('<span class="internal boldnshit">Failed to retrieve context menu option data. Report this bug.</span>');
		}
	}
});

$subOptions.on('click', '#filterMessagesOpt', function(e) {
	if ($('#filterMessages').is(':visible')) {return;}
	var content = '<div class="head">Filter Messages</div>'+
		'<div id="filterMessages" class="filterMessages">';
	$.each(opts.showMessagesFilters, function(key, val) {
		content += '<div><input type="checkbox" id="filter_'+key+'" name="'+key+'" value="'+key+'" '+(val.show ? 'checked="checked" ' : '')+'/> <label for="filter_'+key+'">'+key+'</label></div>';
	});
	content += '</div>';
	createPopup(content, 150);
});

$('body').on('click', '#filterMessages input', function() {
	var type = $(this).val();
	console.log('hit change event with type: '+type);
	toggleFilter(type);
	$('body,html').scrollTop($messages.outerHeight());
}); </script>�  ����DY    �   �PNG

   IHDR   �   �   ~M(   PLTE�����̙��fff���333   �&�B   tRNS @��f   pzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%�����3�(17�6���$V��:Pȥ����� �JV��]�  �IDATh���r��@��Ylgdm��:��˼;���;U�t�H��,ǻ��i@j���[��?bY�y�t.�E_1N�^-?��Z��������Vيe��c��=�f(��¶����5�*���"���g_���_�l9��� �$=v�����i��Y S�	.�E���C�l�e!Ӏ�k���m��y�J�r>�X��쒀ק�-�ڱ[���0M��c�C�����r<�[�q�h�4��ax�4 �z��l1Ͽo�ov��ZZ�dv������^K��[q&�%�H�ax��4 ��D&�{;�nw9i�۱PƇ|���X���֎[�Ҿ�zC�Ȥ>q��vN�Sv+�2guL���"���#]�CS����˪����c�L���u�%� �*MDʃ<�sV������xT�[�M��`����OZ�mg��4][XH�򀶥��c���lOO� ��<��NJrߑG�g�N�*�bײ*�e�t�S�ӡ��^X�B�N�9�-+���,��A"-:�lr���a�-)����MA(KsnF�r4fݰL^ƒ?Љ]d�@�q1t�T��ӗ���s5�6ͨI��K��c���_�s��.�1����i6�!v�����Px�w�8�C���!w�vyU�������b��������˾�,+fo���T�)�;ۘ"����v�N0-���o�.F���3<�}q.+/o�.A���f�/uf����12��6[ێOC��x�wp��i@�u��j�W������Ӏȷ���Miy����~'��D^mkx(uic��߉���Ѩ߳4��s.o�N$�$ �x0�U�����7~!���R�}��S��o��z�YOp���tt��7~�&�=VW�\��]lg�~v�i�Qg� �wlm(p�����N��;�gN������x�w��Tn�B3�U�py�wQ��Va;�85*�[�sK����#�������~9KC3L^���7~�)s�������x����:�K�~QI�m���|������{M�G|������'|���~d=����XM&�����r�����6�9���T�3s�Î�W�	�ċ�H�l!���l��eP��0T�:�br�'�{W�����%�������C��^�D�����Ae���z�1��/����5��������1�T`��n@�LTf����aL���;�yh�~.6*=�eGv˾��n@�]Q��4��=�5�;o���N>�e:�M[C��t�H������EM[i�� ��\�߽�8�}�^���="ӑ�~GO )N��OQ[���.�/��x��'�ڨ `���i^���إY]XDC�0k�a��e:�`̎�ɩ���c�y:X�g��ܝ3(.���:�P�����X~����*dl�E�:�&K'Ò-�eٍ6�0M:/��v���i���L��g�n��b�5��oYN���2�Aη�x�`�Y>H�Z����pf/��Ɵ�w�?�ߥ�:��]���gV�����W4����(�M`���7~����;6!���}����o����'ˎw�n�QC��C�}�e������"�� �(hg���S���ִ��E�L�Gf)�߭�����U���b�L�Gf��ր��T�f��.� ���s���!)�j��6ջ��������J���a��������㑝?��<t�F���:(�a�wҨj\Ң�0���IF.;~��}�L�a��~v��;ٛ�7�,ƁL��p����ys�J�>�rd����n�q��aC�eP������fr4V�`�"ǅ���=F��D�O�
��k��Q�w0�ӎ^�knL�Ńr\F�9d������F�����8Ҁd�0�FG�k�^��C>~`/x|R2u>��ON���̦ǌ��!��jH3��MC��n�ݘ>{���aۏ���~R��9�/�������Y�������|�7��    IEND�B`��   ��]U�DY    e  traitorTips.html <link rel=stylesheet type=text/css href=http://cdn.goonhub.com/css/style.css> <div class=traitor-tips> <h1 class=center>You are a traitor!</h1> <img src=http://cdn.goonhub.com/images/antagTips/traitor-image.png class=center> <p>1. The Syndicate has provided you with a disguised uplink. It can either be your <em>PDA</em> or <em>headset</em>.</p> <p>2. The details and your objectives will always be stored in your notes. To access them, use the <em>Notes</em> verb.</p> <p> 2. To unlock a <em>PDA</em>:<br> <span class="small indent"> 1. Put your PDA in an empty hand and click on it.<br> 2. Under 'General Functions', select 'Messenger'.<br> 3. Click 'Set Ringtone'.<br> 4. Enter the password. </span> </p> <p> 3. To unlock a <em>headset</em>:<br> <span class="small indent"> 1. Put your headset in an empty hand and click on it.<br> 2. Dial in the frequency assigned to you.<br> 3. Press the 'Lock' button after you're done buying the items.<br> 4. It will now function as a regular headset again. </span> </p> <p>4. For more information, please consult <a href=http://wiki.ss13.co/Syndicate_Items>the wiki</a>.</p> </div>6   ?wp��DY    $    DDMI   �   seeds-ovl @��� � �B .   -�8�DY        DDMI   �  intercom @  ��  ʷ2U�DY    |   �PNG

   IHDR           D���   <PLTELiq+++332PPQjijTTT���=����� �����~��YYYzx|IIIh����  ZD   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   ~IDAT8��I�0Ckyh����w�)]9�}�7ZHO�駠H��RUt\5$����SJ3`9�g��r�D>jX<P�rԠ���q^�c����NB�u��+b�]ommfb�z���1��tx�W�9O�}�9	�    IEND�B`�  ���.EY    
   �PNG

   IHDR   �   �   ~M(   PLTE�����̙��fff���333   �&�B   tRNS @��f   pzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%�����3�(17�6���$V��:Pȥ����� �JV��]�  'IDATh����b�*�aE�:��k���#j�
��Dm�g����-�& �f9�=�A�*�1����3u����@7����r��0���̭=f��z��
�����u����'�㉒��ϏT���sȀ��Qz�kn�=>��z�����:��É"�=�����70�;�~�I9(B�u��(>�k2J������RYV��z��v���{N���XR�]3�h��~��T�!u��ñ�_8t9���H�n3�p,ӢU:���iŠ�:
OC̾|DK'LW��ˀ�R�[AZ��y�1?�N�j�uO.�Ã��=��Om�1��Q�K���������������� ��1=��Wm��F'��ȼ��?^�p��`n B��x�*�6�8��'T��]�2�mc�I�-��^]�]6����î
�9��ʚ�aC��qЉ�%1�:W*�{:��R�@5����z�FqG=�^O�������Øꆘ��)v^�G.;��3�0~������e߭ZuA;}�fLt��֌��N��ݚS���ݾ���Gg躀ݾ���?�Gi������lmq<n�HX��x�wk�T)i�N߭�Z��}�懡�5^;}�f`ǂ�>���5+Uu��z��Ub؊=v��c�pʲ�=�;}���É~����y��]��6��q�^	&�uni��t�1��DKxa�ǟ�]<;�<F���=����{�u�?�n`�H�Y|����U�H�N߭9�3���p�I{b8`���V��S�v�.+�����.��]�iЈJ��D��cȁ��]�p{���li����w��DEj��q'J�?����z��>76����S���y[뽇R����;�����^�vV��y����3g��.O}�{�쿩7U���ܼc�;��ÊU/�����E���"��M��^�(mo�j��Ί���^�=$[����^�=R�>��^��Q�~������z/� t_����b9��Q�������pJ��?^��=1���g�q_�U!=�&��橃��}N_�@�J0��T�l�~����;���>�Z�����6�,�����-�q%}�ǥ�wG� +���L�^������S��޳C�A����_��m�����4�¢�l��Ȃn-O�$�g;�6ք��_�c��޳�xө�Ug_D��#E+rC�7����zѓh��4�t9_e90#N��^_.~�LƷ'���f����𬽞�A�m�wHѻ����p��}��kk:��n�Ѳ�w����n�;}��br4�G��3�[��Ge��齷��;���U�4���}��JV��v�Nw�g�����n+Ŷ�^/��N�Q������V����<*R�}�"z��2?��w��{+&���ͭ�,�}�$�nĴ�x^�'�׋�Kj��e�SOϟm�<���P+i+�=�C`�qr/����fs��g��ѻ���n�;�}�M���n�u���w);h���;��K4��]��Z���b�]��]�6�4:�� 6�H�!c�w��}U%���'(Y�?�f�j:���|�t�:���Z��eмĀx�����H��"5�����!��Y    IEND�B`�L   P�Lr9EY    :    DDMI2   X   body_m @���   �B Y   eyes @����BB�  |�azTEY    �   �PNG

   IHDR   �   �   ~M(   PLTE������fff���   333���r���   tRNS @��f   pzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%�����3�(17�6���$V��:Pȥ����� �JV��]�  �IDATh���Aw�:�q���'i�6��6����s�T�$��#��A�4F�{Y��_�hmH�b�G��я��̏m~�*� N�ϵ��v�7iI��D�ұlM��Ӏq[��_�Hg�$��˟,�A����/���p0b�j�j�C�� "���χ;F�o��t~�@$���:[�?ش��r�[yX�^t�������� �f�I�w�ݤ_0w\�
]��B)t�F ���V#2ɯ�*��2���z�������S�ֈZ�ןӀ[���P<g����
/3-R�jT�sV�c��J!���f� ȓ���f�ѳi�t�d�tJ_�� m֟�a3�G���<�uZ)2��E� �� ����Q,9�l�EV�y���un�4�h;����G
e�[g��� ���� @Jr�ϱi��Ly�D����vc"�yqZ�<@c�˿�7D��=���d���)NI2�_�|�yC�ْ��>	�[k*K��>����]Gl��́�;!vn�sm�I��|O�������\dS9m�w)��xJ��.RyP�M�E�*���銊��<G�W���<����ס;m����l��;}�w>o��Cuv��;��Bj%	&�}�V]���w^c!�7��7}7��=l!����;���[�`�3Ӳ�wƋgl�nу!Yԛ�۾�y+8�wl�����_�o��痺��l����;����e��|"�ϒ:}�w^d����[}�0Lޠm��j���sx�����9l�]�>�9:*�.�ܭ��6�g.I�v����C��R[}�3��
Qv��V��|f5��R������Y%݀T_���m���`��i�����;�� �R��a��|.1g[�w��;�+����껈���a����"��#��{�d��m��9��M��O�8�O�������cX�	�c�v���5u��?|����&}���;��y�xؾދ>�WN���A{{/��-����-s���Q{{o+�b���9ƾ�M4��n�7�:}�wp׊�=^�k�w�@��e����I���yn_�m����^�
����{!+%n���=L_���go�5BT���ã����  �?hW�����O!b��]�''o��X��1�8��w{�C���'s��!�g�7�黝˛c�'9l&��������ϖ�ӬE�_�<��{&\R˶z����P�)��?fo���VY���c��^�J(�ȧ=�go�^u�%��{^6�?l��D/\�M���[:ć\ܵȗ�C�-�l��)|`���`#oz2�����r9^e�#�;m���F���ܼ������M:=X���a�޸.��j[}��l
Xm���C������.nΚ���V��;@m� ���wNy:���ދu���wn�������=M:}����8/Ϥo�ϝ����V�}eT����S?2Nw�}�w[���D���w���-�~c򬭾�;F:~=7���{��
�JO}�NS3�6�{�B���M��;z�=�bI�=�r�--�.d@�FS��"ϧɍo�.JI�y����G���}�f=c�5�/.������{����gm����z\k��xS��u�_g��RգLB3e����.>�;0��J�}�:��j�}W��?��wq:�]��+��냪:�f�v��E��R��K����׻�Fr���x��z�@��i1 ��%����ȝO�zqY$����ko�BS�1    IEND�B`�+   �����EY        DDMI   K  clown @  �u  4�y�EY    c   �PNG

   IHDR           �Tg�   *PLTELiq����������%�� ����*�  �  �  �  �  �8�   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   wIDAT(�c`L�Q��YY ̨��, Y@X]YI��LHII�I�Mr�L�Vd����*�@*�e�@�����hlll�RLKRB�4&)�4g�Z�{�M� �֚3g�(a��` �0ʪR    IEND�B`�.   s�ӣEY        DDMI   �   handcuff @  �d  @|�EY    R   �PNG

   IHDR           �Tg�   PLTELiqMMM...rrrHHHTSS�Z�   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   {IDAT(�c`�@��Ȅ&"�� �"���$ �,l�al���`��av	"���P�` �b M�L�̮n�@��4� +P�9-,�Y�Y���0�Zf�;�]�P�n���  �8Ƭ'G    IEND�B`�-    ���EY        DDMI   �  headset @  �<  V 0�EY    *   �PNG

   IHDR           �Tg�   PLTELiq&%%ooo���332���((( ���~�   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   MIDAT(�c`L�QM@�D U�q�#��i*��y�!���F趠�`P6V``DVT���6&!� �0Bփ���AP�a� ,�T\�    IEND�B`�+   �3���EY        DDMI   �   clown @  �=  eN�EY    +   �PNG

   IHDR           �Tg�   PLTELiq�����m����������3���M   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   NIDAT(�c`f�QF@��� �/(�P (����:#���R����Z��U]]����Q�(U@�X)<U�A	�? ���	$�r    IEND�B`�+   �I8{�EY        DDMI   �  funny @  ��  ѐ�ۣEY    �   �PNG

   IHDR           D���   EPLTELiq���^^^HHH|||???� f�3 ����f��f �� 3�� z��Y� ����͓ I�3 � �� ��33�3 �`�K   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   �IDAT8���� E5 %֦`��S��p�ڙ��{�b�u�I߷��J�Z_�CB7[@������͏�K���9O��"t��i���<��X��]��blɧJ5� �#N�̄�U��H�� ��ņ��qr4��['f�g�sxVj�]�{��c�a�|D>_1{����q�,��$,�*4r1Dq��$n�QyG.�����ՠ�    IEND�B`�.   ��lc�EY        DDMI   b  id_clown @  �~  a*�EY    l   �PNG

   IHDR           D���  PPLTELiqddd���t�����]�̍��ڨۻ��]��kkk���͘՛h��sèt�Ð�]��_�̛��jjj�{ό�����Ԣ�f�ڗ��iii;�;W�WӜә��������ӫM�~;O�Oա�۫�R����������<ӱRӭNӵVB�BH�HÏՠn�������������ӝ;^e^��Թ��өI;�;�~�]]�XNŢ��ݷpӠ@���������EMEӦGMMfېv����ҡa����SI�[SME�HM�jU�צa����E;�E;@E���������\��9;E�ggg��������L��T��;��;��a���ܱ��   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C  ZIDAT8�Ւ�7BQ�kw�{ԦL9�+�J�[fJ�Bƈd*eH��ߜ\�u�-��������am��_�h�tp��@m�	�tq��S.3%D��k[,����y��;{z�.k����X��5̘��P2:F����0Ωo�6ƨ����� I �SA�iD�Ygx��s�e%YXĥe��j}���5��h$�Oă[��>�	1J��T
��һ{����a����#;>9@6��=���s��ˌ���W��uG�\�nn��p�/0����\�AF,W��IjڲPz~��-W_�����@����z<�K)B�Tk�
�9$�{�.��  ���F@Q�����O�	{�,�{�>l    IEND�B`��   0�aX3FY    �    DDMI�   X   body_m @���   �B w   No Underwear @�������BBk  BJ  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?V  static @���B1   n/��LFY        DDMI   �  cursedclown @  �a  ��g1LFY    O   �PNG

   IHDR           �Tg�   PLTELiq��;q�������� ���c�b�7{�m(   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   rIDAT(�c`L�Q��YY@�(%�TY@XMYI��THII�I�T��\�Y���1�
U�
dCYA*��e�@�3)*!��C���(��@B@������!��ѤC  �?��'�    IEND�B`�1   1^-@LFY        DDMI   �   cursedclown @  �T  |�t�LFY    B   �PNG

   IHDR           �Tg�   PLTELiqb�h�,���[�7������3(((122�e(   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   bIDAT(�c`�@�H02�a
)10)	�U0*))+))�U��8���(��L..ƥ�&.Np,.faa&.C,�2��͜f���r}5x  �V�8��m    IEND�B`�+   qSN�LFY        DDMI   �  latex @  �  śReLFY    m   �PNG

   IHDR           �Tg�   PLTELiq[[[ZZZ��������򿿿0   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   �IDAT(��O�� Lp��?�,� �g2@�*e�
I[E� �}�-��]wy(:a:間ps�F�~�lX6d��P
[D�c�,1�b|���*�C��Z��5�f��Y�C?�vҾ� ��nq=+�i�}97?	_K!���D}c�%�&�D��bjY    IEND�B`�  yOx] GY    �  Heartache.mid MThd     �MTrk  
� �X �Y�  �Y   �Y   �Q�  �y  �  �d 
@ [  ]  �! �`�?P�c? HP�cH FP�cF DPqD BPqB AP�cA DP�cD FP�F �A?P KP�c?  K HP TP�cH  T FP RP�cF  R DP PPqD  P BP NPqB  N AP MP�cA  M DP PP�cD  P FP�F 1AP�cA DP�cD FP�GF IP�cI KPqK IPqI HP�cH IP�cI FP�F �KP�cK TP�cT RP�cR PPqP NPqN MP�cM PP�cP RP�R �ADP KP�cD  K KP TP�cK  T IP RP�cI  R HP PPqH  P FP NPqF  N DP MP�cD  M AP PP�cA  P BP FP�B  F 1<P AP�c<  A ?P DP�c?  D AP FP�GA  F AP IP�cA  I BP KPqB  K AP IPqA  I ?P HP�c?  H AP IP�cA  I AP FP�A  F �QAP FP�cA  F DP IP�cD  I FP KP�cF  K DP MP�D  M 1DP IP�cD  I FP KP�cF  K DP MP�GD  M FP KP�cF  K DP IPqD  I FP KPqF  K ?P HP�c?  H AP DP�cA  D AP FP�A  F 1=P�c= ?P�c? AP�GA ?P�c? =Pq= ?Pq? <P�c< DP�cD AP�A 1DP IP�cD  I FP KP�cF  K DP MP�GD  M FP KP�cF  K DP IPqD  I FP KPqF  K ?P HP�c?  H AP DP�cA  D AP FP�A  F �!?P KPq?  K ?P KP�c?  K ?P KP�c?  K ?P KPq?  K ?P KP�c?  K ?P KP�c?  K ?P KP�c?  K ?P KPq?  K ?P KP�c?  K ?P KP�c?  K ?P KPq?  K ?P KP�c?  K ?P KP BPqB =Pk?  K = ?P KP GPqG BPk?  K B �GMPJM NPJN OPJO IP PP�cI  P IP PP�cI  P HP OP�cH  O HP OP�cH  O HP OP�cH  O MPJM NPJN OPJO IP PP�cI  P IP PP�cI  P HP PP�cH  P FP OPqF  O DP MPqD  M DP KP�cD  K FP MP�F  M �!MPJM NPJN OPJO IP PP�cI  P IP PP�cI  P HP OP�cH  O HP OP�cH  O HP OP�cH  O ?P�c? HP�cH FP�cF DPqD BPqB AP�cA DP�cD FP�GF IP�cI KP�cK IP�cI KP�cK MP�GM KP�cK NP�cN MP�cM KP�cK MP�GM NP�cN MPqM NPqN KP�cK MP�cM IP�GI KP�cK HPqH IPqI FP�cF DP�cD AP�GA BP�cB DP�GD FP�cF AP�GA BP�cB DP�GD FP�cF MP APJM NP"A BP!N OPJO  B IP PP AP�cI  P IP PP�cI  P HP OP�cH  O HP OP�cH  O HP OP�cH  O MPJM NPJN OPJO IP PP�cI  P IP PP�A TI  P HP PP�cH  P FP OPqF  O DP MPqD  M DP KP�cD  K FP�GF IP�cI KP�cK IP�cI KP�cK MP�GM KP�cK NP�cN MP�cM KP�cK MP�GM NP�cN MPqM NPqN KP�cK MP�cM IP�GI KP�cK HPqH IPqI FP�cF DP�cD AP�GA BP�cB DP�GD FP�cF AP�GA BP�cB DP�GD FP�cF APqA BPqB AP�A �!DP KP�cD  K KP TP�cK  T IP RP�cI  R HP PPqH  P FP NPqF  N DP MP�cD  M AP PP�cA  P BP FP�B  F 1<P AP�c<  A ?P DP�c?  D AP FP�GA  F AP IP�cA  I BP KPqB  K AP IPqA  I ?P HP�c?  H AP IP�cA  I AP FP�A  F �QAP FP�cA  F DP IP�cD  I FP KP�cF  K DP MP�D  M 1DP IP�cD  I FP KP�cF  K DP MP�GD  M FP KP�cF  K DP IPqD  I FP KPqF  K ?P HP�c?  H AP DP�cA  D AP FP�A  F 1=P�c= ?P�c? AP�GA ?P�c? =Pq= ?Pq? <P�c< DP�cD AP�A 1DP IP�cD  I FP KP�cF  K DP MP�GD  M FP KP�cF  K DP IPqD  I FP KPqF  K ?P HP�c?  H AP DP�cA  D AP FP�A  F 1DP IP�cD  I FP KP�cF  K DP MP�GD  M FP KP�cF  K DP IPqD  I FP KPqF  K ?P HP�c?  H AP DP�cA  D AP FP�A  F �/ MTrk  > �Y�  �Y   �Y   �!  �.P *Pq. 1Pk* 1 0Pq0 1Pq1 .Pq. .P *Pq. 0Pk* 0 1Pq1 8Pq8 5Pq5 .P *Pq. 1Pk* 1 0Pq0 1Pq1 .Pq. .P *Pq. 0Pk* 0 1Pq1 8Pq8 5Pq5 .P )Pq. 1Pk) 1 0Pq0 1Pq1 .Pq. .P )Pq. 0Pk) 0 1Pq1 8Pq8 5Pq5 )P�c) ,P�c, 0P�c0 3P�c3 0Pq0 ,Pq, 3Pq3 0Pq0 .P *Pq. 1Pk* 1 0Pq0 1Pq1 .Pq. .P *Pq. 0Pk* 0 1Pq1 8Pq8 5Pq5 .P *Pq. 1Pk* 1 0Pq0 1Pq1 .Pq. .P *Pq. 0Pk* 0 1Pq1 8Pq8 5Pq5 .P )Pq. 1Pk) 1 0Pq0 1Pq1 .Pq. .P )Pq. 0Pk) 0 1Pq1 8Pq8 5Pq5 ,P�c, 'P�c' )P�c) ,P�c, 0P�c0 3P�c3 *P�c* 0Pq0 1Pq1 .Pq. )Pq) *P�c* 0Pq0 1Pq1 .Pq. 3Pq3 ,P�c, 'Pq' )Pq) ,Pq, )Pq) 'P�c' )P�c) ,P�c, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 ,Pq, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 ,Pq, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 )Pq) ,P�c, 'P�c' ,P�c, *P .P :Pq*  .  : 1P =Pq1  = 0P <Pq0  < 1P =Pq1  = .P :Pq.  : *P .P :Pq*  .  : 0P <Pq0  < 1P =Pq1  = 8Pq8 5P APq5  A *P .P :Pq*  .  : 1P =Pq1  = 0P <Pq0  < 1P =Pq1  = .P :Pq.  : *P .P :Pq*  .  : 0P <Pq0  < 1P =Pq1  = 8Pq8 5P APq5  A )P .P :Pq)  .  : 1P =Pq1  = 0P <Pq0  < 1P =Pq1  = .P :Pq.  : )P .P :Pq)  .  : 0P <Pq0  < 1P =Pq1  = 8Pq8 5P APq5  A )P 5P�c)  5 ,P 8P�c,  8 0P <P�c0  < 3P ?P�c3  ? 0P <Pq0  < ,P 8Pq,  8 3P ?Pq3  ? 0P <Pq0  < *P .P :Pq*  .  : 1P =Pq1  = 0P <Pq0  < 1P =Pq1  = .P :Pq.  : *P .P :Pq*  .  : 0P <Pq0  < 1P =Pq1  = 8Pq8 5P APq5  A *P .P :Pq*  .  : 1P =Pq1  = 0P <Pq0  < 1P =Pq1  = .P :Pq.  : *P .P :Pq*  .  : 0P <Pq0  < 1P =Pq1  = 8Pq8 5P APq5  A 3P ?Pq3  ? 5P APq5  A 8P DPq8  D :P FPq:  F <P HPq<  H =P IPq=  I ?P KPq?  K =P IPq=  I <P HPq<  H :P FPq:  F 8P DPq8  D 5P APq5  A ,P 8P�c,  8 'P 3P�c'  3 )P 5P�c)  5 ,P 8P�c,  8 0P <P�c0  < 3P ?P�c3  ? *P�c* 0Pq0 1Pq1 .Pq. )Pq) *P�c* 0Pq0 1Pq1 .Pq. 3Pq3 ,P�c, 'Pq' )Pq) ,Pq, )Pq) 'P�c' )P�c) ,P�c, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 ,Pq, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 ,Pq, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 )Pq) ,P�c, 'P�c' )P�c) 'P�c' ,Pq, .Pq. *Pq* %Pq% 'P�c' ,Pq, .Pq. 0P�c0 )P�c) 0Pq0 8Pq8 5Pq5 0Pq0 )Pq) 5Pq5 ,Pq, 5Pq5 .Pq. 8Pq8 *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 )Pq) *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 *Pq* )Pq) 5Pq5 0Pq0 8Pq8 5Pq5 0Pq0 )Pq) 5Pq5 ,Pq, 5Pq5 .Pq. 8Pq8 *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 )Pq) *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 *Pq* ,Pq, 'Pq' 0Pq0 ,Pq, 3Pq3 0Pq0 8Pq8 ,Pq, 3P�c3 0P�c0 .Pq. )Pq) 0Pq0 ,Pq, 1Pq1 )Pq) /Pq/ 1Pq1 3Pq3 *Pq* .Pq. 1Pq1 /Pq/ *Pq* 1Pq1 *Pq* 3Pq3 *Pq* 6Pq6 /Pq/ 8Pq8 /Pq/ =Pq= 8Pq8 /Pq/ *Pq* 1Pq1 *Pq* 3Pq3 *Pq* /Pq/ *Pq* 1Pq1 *Pq* 3Pq3 *Pq* 6Pq6 /Pq/ 8Pq8 1Pq1 =Pq= 8Pq8 ;Pq; 6Pq6 �g/Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 .Pq. 1Pq1 0Pq0 1Pq1 .Pq. .Pq. 0Pq0 1Pq1 8Pq8 5Pq5 )P�c) ,P�c, 0P�c0 3P�c3 0Pq0 ,Pq, 3Pq3 0Pq0 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 .Pq. 1Pq1 0Pq0 1Pq1 .Pq. .Pq. 0Pq0 1Pq1 8Pq8 5Pq5 ,P�c, 'P�c' )P�c) ,P�c, 0P�c0 3P�c3 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 .Pq. 1Pq1 0Pq0 1Pq1 .Pq. .Pq. 0Pq0 1Pq1 8Pq8 5Pq5 )P�c) ,P�c, 0P�c0 3P�c3 0Pq0 ,Pq, 3Pq3 0Pq0 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 .Pq. 1Pq1 0Pq0 1Pq1 .Pq. .Pq. 0Pq0 1Pq1 8Pq8 5Pq5 )P�c) ,P�c, 0P�c0 3P�c3 0Pq0 ,Pq, 3Pq3 0Pq0 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 .Pq. 1Pq1 0Pq0 1Pq1 .Pq. .Pq. 0Pq0 1Pq1 8Pq8 5Pq5 )P�c) ,P�c, 0P�c0 3P�c3 0Pq0 ,Pq, 3Pq3 0Pq0 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 /Pq/ 3Pq3 1Pq1 3Pq3 /Pq/ /Pq/ 1Pq1 3Pq3 ;Pq; 6Pq6 .Pq. 1Pq1 0Pq0 1Pq1 .Pq. .Pq. 0Pq0 1Pq1 8Pq8 5Pq5 ,P�c, 'P�c' )P�c) ,P�c, 0P�c0 3P�c3 *P�c* 0Pq0 1Pq1 .Pq. )Pq) *P�c* 0Pq0 1Pq1 .Pq. 3Pq3 ,P�c, 'Pq' )Pq) ,Pq, )Pq) 'P�c' )P�c) ,P�c, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 ,Pq, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 ,Pq, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 )Pq) ,P�c, 'P�c' )P�c) 'P�c' ,Pq, .Pq. *Pq* %Pq% 'P�c' ,Pq, .Pq. 0P�c0 )P�c) 0Pq0 8Pq8 5Pq5 0Pq0 )Pq) 5Pq5 ,Pq, 5Pq5 .Pq. 8Pq8 *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 )Pq) *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 *Pq* )Pq) 5Pq5 0Pq0 8Pq8 5Pq5 0Pq0 )Pq) 5Pq5 ,Pq, 5Pq5 .Pq. 8Pq8 *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 )Pq) *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 *Pq* ,Pq, 'Pq' 0Pq0 ,Pq, 3Pq3 0Pq0 8Pq8 ,Pq, 3P�c3 0P�c0 *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 )Pq) *Pq* 6Pq6 1Pq1 3Pq3 5Pq5 *Pq* )Pq) 5Pq5 0Pq0 8Pq8 5Pq5 0Pq0 )Pq) 5Pq5 ,Pq, 5Pq5 .Pq. 8Pq8 .Pq. :Pq: 3Pq3 5Pq5 1Pq1 ,Pq, .Pq. :Pq: 3Pq3 5Pq5 1Pq1 ,Pq, .P�3. �5.P�3. �5.Pw. y.Pw. y.Pw. �/ w   @��cqGY    e    DDMI]   d  �  pda @   BJ  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?V  static @���By   l��xGY    g    DDMI_   d  �   black @   BJ  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?V  static @���B�]  z.k@�GY    e]  DRAME.mid MThd      xMTrk   �!  �
AB@  A� �!  �X �Y�  �Q
,+ �Sequenced by Bregalad � Final Fantasy VII - Arena battle�h�	loopStart��X�`�X�l�X�p�X�`�X�l�X �Y  �v�X�`�X�v�X�`�X�H�loopEnd��X �Y� �`�X�l�X �/ MTrk   �!  �Trumpets �   �8 �Z �
n�p�Od Dd JdJ  D  O <Od Dd JdJ  D  O �hDd Od JdJ  O  D <Od Dd JdJ  D  O �,Od Dd JdJ  D  O <Od Dd JdJ  D  O �,Od Dd JdJ  D  O <Od Dd JdJ  D  O �Od Dd JdJ  D  O <Od Dd JdJ  D  O �hDd Od JdJ  O  D <Od Dd JdJ  D  O �,Od Dd JdJ  D  O <Od Dd JdJ  D  O �,Od Dd JdJ  D  O <Od Dd JdJ  D  O �JJ LJ QJQ  L  J JO LO QOQ  L  J JZ LZ QZQ  L  J Je Le QeQ  L  J iHL JL OLO  J  H HZ JZ OZO  J  H Hc Jc OcO  J  H Hg Jg OgO  J  H iJL EL MLM  E  J JU EU MUM  E  J J` E` M`M  E  J Jd Ed MdM  E  J -Jd Ed LdL  E  J Jd Ed LdL  E  J -Gd Hd OdO  H  G Gd Hd OdO  H  G -Ld Jd QdQ  J  L Ld Jd QdQ  J  L -Od Qd TdT  Q  O Od Qd TdT  Q  O -Qd Ld RdR  L  Q Qd Ld RdR  L  Q �JJ LJ QJQ  L  J JO LO QOQ  L  J JZ LZ QZQ  L  J Je Le QeQ  L  J iHL JL OLO  J  H HZ JZ OZO  J  H Hc Jc OcO  J  H Hg Jg OgO  J  H iJL EL MLM  E  J JU EU MUM  E  J J` E` M`M  E  J Jd Ed MdM  E  J -Jd Ed LdL  E  J Jd Ed LdL  E  J -Gd Hd OdO  H  G Gd Hd OdO  H  G -Ld Jd QdQ  J  L Ld Jd QdQ  J  L -Od Qd TdT  Q  O Od Qd TdT  Q  O -Qd Ld RdR  L  Q Qd Ld RdR  L  Q �LR JR GRG  J  L LT JT GTG  J  L LY HY EYE  H  L L] G] C]C  G  L L` G` C`C  G  L La Ha EaE  H  L Lb Hb EbE  H  L Ll Jl GlG  J  L Ln Jn GnG  J  L Lp Hp EpE  H  L Lx Gx CxC  G  L -LR JR GRG  J  L LT JT GTG  J  L LY HY EYE  H  L L] G] C]C  G  L L` G` C`C  G  L La Ha EaE  H  L Lb Hb EbE  H  L Ll Jl GlG  J  L Ln Jn GnG  J  L Lp Hp EpE  H  L Lx Gx CxC  G  L �eMN JN ONO  J  M MP JP OPO  J  M KR HR ORO  H  K JW OW FWF  O  J J[ F[ O[O  F  J K` H` O`O  H  K Kf Hf OfO  H  K Mh Jh OhO  J  M Mi Ji OiO  J  M Kq Hq OqO  H  K Jv Fv OvO  F  J -MN JN ONO  J  M MP JP OPO  J  M KR HR ORO  H  K JW OW FWF  O  J J[ F[ O[O  F  J K` H` O`O  H  K Kf Hf OfO  H  K Mh Jh OhO  J  M Mi Ji OiO  J  M Kq Hq OqO  H  K Jv Fv OvO  F  J �OOd Dd JdJ  D  O <Od Dd JdJ  D  O �hDd Od JdJ  O  D <Od Dd JdJ  D  O �,Od Dd JdJ  D  O <Od Dd JdJ  D  O �,Od Dd JdJ  D  O <Od Dd JdJ  D  O  �/ MTrk  C �!  �	Trombonne �   �9 �Z �
Z �2d2 <2d2 <2d2 0d0 0d<0  2d2 <2d2 <2d<2  5d<5  3d<3  2d2 <2d2 <2d2 0d0 0d<0  2d2 <2d2 <2d<2  3d<3  5d5  6d6  7d7 <7d7 <7d<7  5d<5  8d<8  7d<7  2d<2  3d<3  4d<4  5d<5  6d<6 �L2d2 <2d2 <2d2 0d0 0d<0  2d2 <2d2 <2d<2  5d<5  3d<3  2d2 <2d2 <2d2 0d0 0d<0  2d2 <2d2 <2d<2  3d<3  5d5  6d6  7d7 <7d7 <7d<7  5d<5  8d<8  7d<7  2d<2  3d<3  4d<4  5d<5  6d<6 �X2d2 <2d2 <2d2 0d0 0d;0 2d2 <2d2 <2d<2  5d<5  3d<3  2d2 <2d2 <2d2 0d0 0d<0  2d2 <2d2 <2d<2  3d<3  5d5  6d6  7d7 <7d7 <7d<7  5d<5  8d<8  7d<7  2d<2  3d<3  4d<4  5d<5  6d<6 �L2d2 <2d2 <2d2 0d0 0d<0  2d2 <2d2 �WVUT�2d �SRQPO�2  5d�NMLK�5  3d
�JIHG�3  2d�FE	�2 �DCBA
�2d�@?�2 �>=<;�2d �:9�2  �876�0d�54�0 �32�0d
�10/.�0  2d�-,�2 �+*)(
�2d�'&
�2 �%$#"�2d�! �2  3d��3  5d��5  6d
��6  7d��7 �	�7d�
�7 �
	�7d��7  5d � �5  8d<8  �/ MTrk  > �!  �Tuba �   �: �Z �
d �&d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  )d<)  'd<'  &d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  'd<'  )d)  *d*  +d+ <+d+ <+d<+  )d<)  ,d<,  +d<+  &d<&  'd<'  (d<(  )d<)  *d<* �L&d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  )d<)  'd<'  &d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  'd<'  )d)  *d*  +d+ <+d+ <+d<+  )d<)  ,d<,  +d<+  &d<&  'd<'  (d<(  )d<)  *d<* �X&d& <&d& <&d& $d$ $d;$ &d& <&d& <&d<&  )d<)  'd<'  &d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  'd<'  )d)  *d*  +d+ <+d+ <+d<+  )d<)  ,d<,  +d<+  &d<&  'd<'  (d<(  )d<)  *d<* �L&d& <&d& <&d& $d$ $d<$  &d& <&d& �WVUT�&d �SRQPO�&  )d�NMLK�)  'd
�JIHG�'  &d�FE	�& �DCBA
�&d�@?�& �>=<;�&d �:9�&  �876�$d�54�$ �32�$d
�10/.�$  &d�-,�& �+*)(
�&d�'&
�& �%$#"�&d�! �&  'd��'  )d��)  *d
��*  +d��+ �	�+d�
�+ �
	�+d��+  )d � �)  ,d<,  �/ MTrk  M �!  �Horns �   �< �Z �
�x�Ed @d@  E ZEd @dZ@  E  Cd >d>  C ZCd >dZ>  C  Ad 9d9  A ZAd 9dZ9  A  @d 9d�J9  @ �Ed @d@  E ZEd @dZ@  E  Cd >d>  C ZCd >dZ>  C  Ad 9d9  A ZAd 9dZ9  A  @d 9d�J9  @ �7d >d>  7 -7d >d>  7 >d 7d7  > -7d >d>  7 7d >d�4>  7  9d >d>  9 -9d >d>  9 9d >d>  9 -9d >d>  9 9d >d�4>  9  @d 9d9  @ -@d 9d9  @ @d 9d9  @ -@d 9d9  @ 9d @d�4@  9 7P @P@  7 7T @T@  7 7V @V@  7 7X @X@  7 7Y @Y@  7 7\ @\@  7 7_ @_@  7 7b @b@  7 7g @g@  7 7j @j@  7 7v @v@  7 -7P @P@  7 7T @T@  7 7V @V@  7 7X @X@  7 7Y @Y@  7 7\ @\@  7 7_ @_@  7 7b @b@  7 7g @g@  7 7j @j@  7 7v @v@  7 :d AdA  : -:d AdA  : Ad :d:  A -:d AdA  : :d Ad�4A  :  <d AdA  < -<d AdA  < <d AdA  < -<d AdA  < <d Ad�4A  <  Cd <d<  C -Cd <d<  C Cd <d<  C -Cd <d<  C <d Cd�4C  < :P CPC  : :T CTC  : :V CVC  : :X CXC  : :Y CYC  : :\ C\C  : :_ C_C  : :b CbC  : :g CgC  : :j CjC  : :v CvC  : -:P CPC  : :T CTC  : :V CVC  : :X CXC  : :Y CYC  : :\ C\C  : :_ C_C  : :b CbC  : :g CgC  : :j CjC  : :v CvC  :  �/ MTrk  + �!  �
Strings Hi �  �0 �Z �
( �d  e  �>d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  >  9d EdE  9 9d EdE  9  >d JdJ  > <d HdH  <  ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < Ad MdM  A  ?d KdK  ?  >d JdJ  >  ?d KdK  ?  >d JdJ  >  <d HdH  <  >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  >  9d EdE  9 9d EdE  9  >d JdJ  > <d HdH  <  ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < Ad MdM  A  ?d KdK  ?  >d JdJ  >  ?d KdK  ?  >d JdJ  >  <d HdH  <  Od CdC  O Md AdA  M Od CdC  O Pd DdD  P Od CdC  O Md AdA  M Cd Od<O  C  Fd Rd<R  F  Dd Pd<P  D  Od Cd<C  O  Vd Jd<J  V  Td Hd<H  T  Rd Fd<F  R  Td Hd<H  T  Rd FdF  R  Pd DdD  P  Dd Jd OdO  J  D <Dd Jd OdO  J  D �hDd Jd OdO  J  D <Dd Jd OdO  J  D �,Dd Jd OdO  J  D <Dd Jd OdO  J  D �,Dd Jd OdO  J  D <Dd Jd OdO  J  D �,>d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  >  9d EdE  9 9d EdE  9  >d JdJ  > <d HdH  <  ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < Ad MdM  A  ?d KdK  ?  >d JdJ  >  ?d KdK  ?  >d JdJ  >  <d HdH  <  >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  >  9d EdE  9 9d EdE  9  >d JdJ  > <d HdH  <  ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < Ad MdM  A  ?d KdK  ?  >d JdJ  >  ?d KdK  ?  >d JdJ  >  <d HdH  <  Od CdC  O Md AdA  M Od CdC  O Pd DdD  P Od CdC  O Md AdA  M Cd Od<O  C  Fd Rd<R  F  Dd Pd<P  D  Od Cd<C  O  Vd Jd<J  V  Td Hd<H  T  Rd Fd<F  R  Td Hd<H  T  Rd FdF  R  Pd DdD  P  Dd Jd OdO  J  D <Dd Jd OdO  J  D �hDd Jd OdO  J  D <Dd Jd OdO  J  D �,Dd Jd OdO  J  D <Dd Jd OdO  J  D �,Dd Jd OdO  J  D <Dd Jd OdO  J  D �,QdQ  TdT RdR OdO QdQ LdL QdQ JdJ  OdO MdM HdH LdL GdG LdL EdE  JdJ HdH CdC FdF CdC DdD Ed�`E  QdQ  TdT RdR OdO QdQ LdL QdQ JdJ  OdO MdM HdH LdL GdG LdL EdE  JdJ HdH CdC Qd � �    $ , 0 8 @�Q�Q  � �Cd :d Fd<F  :  C  9d EdE  9  Ed <d Hd<H  <  E  :d FdF  :  Fd >d Jd<J  >  F  Ed <d HdH  <  E Fd @d Ld<L  @  F  Jd Ad Md<M  A  J  @d LdL  @  Ld Cd Od<O  C  L  Ad MdM  A  Md Ed Qd<Q  E  M  Ld Cd OdO  C  L Md Gd Sd<S  G  M  Ed <d Hd<H  <  E  ;d GdG  ;  Gd >d Jd<J  >  G  <d HdH  <  Hd @d Ld<L  @  H  Gd >d JdJ  >  G Hd Bd Nd<N  B  H  Gd Cd Od�hO  C  G �hFd =d Id<I  =  F  <d HdH  <  Hd ?d Kd<K  ?  H  =d IdI  =  Id Ad Md<M  A  I  Hd ?d KdK  ?  H Id Cd Od<O  C  I  Md Dd Pd<P  D  M  Cd OdO  C  Od Fd Rd<R  F  O  Dd PdP  D  Pd Hd Td<T  H  P  Od Fd RdR  F  O Pd Jd Vd<V  J  P  Hd ?d Kd<K  ?  H  >d JdJ  >  Jd Ad Md<M  A  J  ?d KdK  ?  Kd Cd Od<O  C  K  Jd Ad MdM  A  J Kd Ed Qd<Q  E  K  Jd Fd Rd�� @ ? > = < ; : 9 8 7 6 5 4 3 2 1 0 / . - + * ) ( ' & % $ # " !                       
 	        �Z�{w
so
kgc
_[
WSO
KG
C?
;73
/+
'#

	�R  F  J �

 � @�>d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  >  9d EdE  9 9d EdE  9  >d JdJ  > <d HdH  <  ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < Ad MdM  A  ?d KdK  ?  >d JdJ  >  ?d KdK  ?  >d JdJ  >  <d HdH  <  >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  >  9d EdE  9 9d EdE  9  >d JdJ  > <d HdH  <  ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < Ad MdM  A  ?d KdK  ?  >d JdJ  >  ?d KdK  ?  >d JdJ  >  <d HdH  <  Od CdC  O Md AdA  M Od CdC  O Pd DdD  P Od CdC  O Md AdA  M Cd Od<O  C  Fd Rd<R  F  Dd Pd<P  D  Od Cd<C  O  Vd Jd<J  V  Td Hd<H  T  Rd Fd<F  R  Td Hd<H  T  Rd FdF  R  Pd DdD  P  Dd Jd OdO  J  D <Dd Jd OdO  J  D �hDd Jd OdO  J  D <Dd Jd OdO  J  D �,Dd Jd OdO  J  D <Dd Jd OdO  J  D �,Dd Jd OdO  J  D <Dd Jd OdO  J  D �,>d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  >  9d EdE  9 9d EdE  9  >d JdJ  > <d HdH  <  ?d KdK  ? >d JdJ  > <d HdH  < >d JdJ  > ?d KdK  ? >d Jd�W�J  > �V�<d Hd�U�H  <  �T�Ad Md �SRQ�M  A  ?d Kd�PO�K  ?  >d Jd�NM�J  >  ?d Kd�LK�K  ?  >d Jd
�JI�J  >  <d Hd�HG�H  <  >d Jd�F�J  > �E	�<d Hd�D
�H  < �C	�>d Jd�B
�J  > �A
�?d Kd�@�K  ? �?�>d Jd�>�J  > �=�<d Hd�<�H  <  �;�>d Jd �:9�J  >  9d Ed �87�E  9 �6�9d Ed�54�E  9  >d Jd�3�J  > 
�2�<d Hd
�10�H  <  ?d Kd
�/�K  ? 	�.�>d Jd�-�J  > �,�<d Hd�+�H  < �*	�>d Jd�)
�J  > �(
�?d Kd�'�K  ? �&
�>d Jd�%�J  > �$�<d Hd�#�H  < �"�Ad Md�! �M  A  ?d Kd ��K  ?  >d Jd��J  >  ?d Kd��K  ?  >d Jd��J  >  <d Hd
��H  <  Od Cd��C  O 	��Md Ad��A  M ��Od Cd��C  O �	�Pd Dd�
�D  P �
�Od Cd��C  O ��Md Ad�
�A  M �	�Cd Od��O  C  Fd Rd � �R  F  Dd Pd<P  D  �/ MTrk  � �!  �
Strings Lo �  �0 �Z �
P �2d &d&  2 <2d &d&  2 <2d &d&  2 0d $d$  0 0d $d<$  0  2d &d&  2 <2d &d&  2 <2d &d<&  2  5d )d<)  5  3d 'd<'  3  2d &d&  2 <2d &d&  2 <2d &d&  2 0d $d$  0 0d $d<$  0  2d &d&  2 <2d &d&  2 <2d &d<&  2  3d 'd<'  3  5d )d)  5  6d *d*  6  7d +d+  7 <7d +d+  7 <7d +d<+  7  5d )d<)  5  8d ,d<,  8  7d +d<+  7  2d &d<&  2  3d 'd<'  3  4d (d<(  4  5d )d<)  5  6d *d<*  6  +d 7d7  + <+d 7d7  + �h+d 7d7  + <+d 7d7  + �,+d 7d7  + <+d 7d7  + �,+d 7d7  + <+d 7d7  + �+d 7d7  + <+d 7d7  + �h+d 7d7  + <+d 7d7  + �,+d 7d7  + <+d 7d7  + �,+d 7d7  + <+d 7d7  + �,Ed @d@  E ZEd @dZ@  E  Cd >d>  C ZCd >dZ>  C  Ad 9d9  A ZAd 9dZ9  A  @d 9d�J9  @ �Ed @d@  E ZEd @dZ@  E  Cd >d>  C ZCd >dZ>  C  Ad 9d9  A ZAd 9dZ9  A  @d 9d�J9  @ �v2d &d&  2 <2d &d&  2 <2d &d&  2 0d $d$  0 $d 0d;0  $ 2d &d&  2 <2d &d&  2 <2d &d<&  2  5d )d<)  5  3d 'd<'  3  2d &d&  2 <2d &d&  2 <2d &d&  2 0d $d$  0 0d $d<$  0  2d &d&  2 <2d &d&  2 <2d &d<&  2  3d 'd<'  3  5d )d)  5  6d *d*  6  7d +d+  7 <7d +d+  7 <7d +d<+  7  5d )d<)  5  8d ,d<,  8  7d +d<+  7  2d &d<&  2  3d 'd<'  3  4d (d<(  4  5d )d<)  5  6d *d<*  6  +d 7d7  + <+d 7d7  + �h+d 7d7  + <+d 7d7  + �,+d 7d7  + <+d 7d7  + �,+d 7d7  + <+d 7d7  +  �/ MTrk  � �!  �
Synth Bass �   �& �d �
< �&d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  )d<)  'd<'  &d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  'd<'  )d)  *d*  +d+ <+d+ <+d<+  )d<)  ,d<,  +d<+  &d<&  'd<'  (d<(  )d<)  *d<*  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  &d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  )d<)  'd<'  &d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  'd<'  )d)  *d*  +d+ <+d+ <+d<+  )d<)  ,d<,  +d<+  &d<&  'd<'  (d<(  )d<)  *d<*  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  !d!  (d(  -d-  d  &d&  +d+  .d.  !d!  (d(  -d-  d  &d&  +d+  .d.  !d!  (d(  -d-  d  &d&  +d+  .d.  !d!  (d(  -d-  +d+  .d.  +d+  &d&  "d"  !d!  (d(  -d-  (d(  .d.  +d+  &d&  "d"  !d!  (d(  -d-  d  &d&  +d+  .d.  !d!  (d(  -d-  d  &d&  +d+  .d.  !d!  (d(  -d-  d  &d&  +d+  .d.  !d!  (d(  -d-  +d+  .d.  +d+  &d&  "d"  !d!  (d(  -d-  (d(  .d.  +d+  &d&  "d"  +x+  +P+  +R+  +x+  +O+  +N+  +x+  +O+  +x+  +T+  +x+  +Q+  &x&  &P&  &R&  &x&  &O&  &N&  &x&  &O&  &x&  &T&  &x&  &Q&  -x-  -P-  -R-  -x-  -O-  -N-  -x-  -O-  -x-  -T-  -x-  -Q-  (x(  (P(  (R(  (x(  (O(  (N(  (x(  (O(  (x(  (T(  (x(  (Q(  (x(  (P(  (R(  (x(  (O(  (N(  (x(  (O(  (x(  (T(  (x(  (Q(  .x.  .P.  .R.  .x.  .O.  .N.  .x.  .O.  .x.  .T.  .x.  .Q.  )x)  )P)  )R)  )x)  )O)  )N)  )x)  )O)  )x)  )T)  )x)  )Q)  0x0  0P0  0R0  0x0  0O0  0N0  0x0  0O0  0x0  0T0  0x0  0Q0  +x+  +P+  +R+  +x+  +O+  +N+  +x+  +O+  +x+  +T+  +x+  +Q+  +x+  +P+  +R+  +x+  +O+  +N+  +x+  +O+  +x+  +T+  +x+  +Q+  )x)  )P)  )R)  )x)  )O)  )N)  )x)  )O)  )x)  )T)  )x)  )Q)  )x)  )P)  )R)  )x)  )O)  )N)  )x)  )O)  )x)  )T)  )x)  )Q)  &d& <&d& <&d& $d$ $d;$ &d& <&d& <&d<&  )d<)  'd<'  &d& <&d& <&d& $d$ $d<$  &d& <&d& <&d<&  'd<'  )d)  *d*  +d+ <+d+ <+d<+  )d<)  ,d<,  +d<+  &d<&  'd<'  (d<(  )d<)  *d<*  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  &d& <&d& <&d& $d$ $d<$  &d& <&d&  �a`_^]�&d�\[ZY�&  )d�XWVUT�)  'd
�SRQP	�'  &d�ON�& �MLKJI�&d
�HG�& �FEDC�&d�BA@�& �?>�$d�=<�$ �;:
�$d�98765�$  &d�43�& �210/�&d�.-�&  �,+*)(�&d�'&%$�&  'd�#"! �'  )d
��)  *d�
�*  +d��+ ��+d��+ ��+d �
	�+  )d��)  ,d� �,  �/ MTrk  � �!  �Synth 1 �  �P �x �
n �b cGb	 cEb
 cP��Rs<R  QsQ  Ts<T  RsR  Vs<V  TsT Xs<X  Ys<Y  XsX  [s<[  YsY  ]s<]  [s[ _s<_  Ts<T  SsS  Vs<V  TsT  Xs<X  VsV Zs<Z  [s�&�|x
t
p
l	h
d
`
\X
T
P
L	H
D�[ �@�Us<U  TsT  Ws<W  UsU  Ys<Y  WsW [s<[  \s<\  [s[  ^s<^  \s\  `s<`  ^s^ bs<b  Ws<W  VsV  Ys<Y  WsW  [s<[  YsY ]s<]  ^s�� @ ? > = < ; : 9 8 7 6 5 4 3 2 1 0 / . - + * ) ( ' & % $ # " !                       
 	        �Z�{w
so
kgc
_[
WSO
KG
C?
;73
/+
'#


�^ � � @ �/ MTrk  � �!  �Timpani �   �/ �d�&�7d<7  2d<2  3d<3  4d<4  5d<5  6d6  7qZ7  7tZ7  7d<7  2d<2  5d<5  2d<2  2\
2  2N
2  2D
2  2D
2  2J
2  2b
2  7xZ7  7{Z7  7d<7  2d<2  5d<5  8d<8  7nZ7  7lZ7  7d<7  2d<2  5d<5  2d<2  7oZ7  7pZ7  7d<7  2d<2  5d<5  2d<2 �&7d<7  2d<2  3d<3  4d<4  5d<5  6d6  7qZ7  7tZ7  7d<7  2d<2  5d<5  2d<2  2\
2  2N
2  2D
2  2D
2  2J
2  2b
2  7xZ7  7{Z7  7d<7  2d<2  5d<5  8d<8  7nZ7  7lZ7  7d<7  2d<2  5d<5  2d<2  7oZ7  7pZ7  7d<7  2d<2  5d<5  2d<2  -d�4-  -d-  -d�4-  -d-  -d�4-  -d-  -d�`-  -d�4-  -d-  -d�4-  -d-  -d�4-  -d-  -d�`- �R7Q7  7Z7  7a7  7nx7 �2Q2  2Z2  2a2  2nx2 �-Q-  -Z-  -a-  -n<-  4nx4 �4/n</  4nx4 �4/nx/ �.Q.  .Z.  .a.  .nx. �5Q5  5Z5  5a5  5nx5 �0Q0  0Z0  0a0  0n<0  7nx7 �42n<2  7nx7 �42n<2  5nx5 �B080  0I0  0X0  0d0  0j0 �&7d<7  2d<2  3d<3  4d<4  5d<5  6d6  7qZ7  7tZ7  7d<7  2d<2  5d<5  2d<2  2\
2  2N
2  2D
2  2D
2  2J
2  2b
2  7xZ7  7{Z7  7d<7  2d<2  5d<5  8d<8  7nZ7  7lZ7  7d<7  2d<2  5d<5  2d<2  7oZ7  7pZ7  7d<7  2d<2  5d<5  2d<2  �/ MTrk   �!  �Snare �   �0 �d �&u 9u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& 9  &w& &Q& &R& &y& &Q& &R& &{& &6&  &>&  &G& &;&  &E&  &N&  &W&  &f&  &j&  &u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& &w& &Q& &R& &y& &Q& &R& &{& &6&  &>&  &G& &;&  &E&  &N&  &W&  &f&  &j&  &u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& &w& �Y9d &w&  9 &N& &O& &w 9w9  & &P& &P& &x& &E&  &U&  &^& &P&  &Z&  &c& &Q&  &^&  &i& &?&  &J&  &w& &N& 9d &O&  9 &w& &P& 9d &P&  9 &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  &P&  &Z&  &c&  &o&  9d &w&  9 &N& &O& 9d &w&  9 &P& &P& &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  9d &w&  9 &N& &O& 9d &w&  9 &P& &P& &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  &u 9u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& 9  &w& &Q& &R& &y& &Q& &R& &{& &6&  &>&  &G& &;&  &E&  &N&  &W&  &f&  &j&  &u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& &w& &Q& &R& &y& &Q& &R& &{& &6&  &>&  &G& &;&  &E&  &N&  &W&  &f&  &j&  &u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& &w& �Y9d &w&  9 &N& &O& &w 9w9  & &P& &P& &x& &E&  &U&  &^& &P&  &Z&  &c& &Q&  &^&  &i& &?&  &J&  &w& &N& 9d &O&  9 &w& &P& 9d &P&  9 &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  &P&  &Z&  &c&  &o&  9d &w&  9 &N& &O& 9d &w&  9 &P& &P& &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  9d &w&  9 &N& &O& 9d &w&  9 &P& &P& &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  d &r&    d &W&    d &X&    d &y&    d &P&    d &U&    d &w  d  &  d &R&    d &R&    d &u&    d &r&    d &W&    d &X&    d &y&    d &P&    d &U&    d &w  d  &  d &R&    d &R&    d &u&    d &r&    d &W&    d &X&    d &y&    d &P&    d &U&    d &w  d  &  d &R&    d &R&    d &u&    d  d &d  d  &  d &u&    d  d  d &u&    d &u  d  &  d  d &u  d  &  d &u&    d  d  d &u&    d &u  d  &  d  d &u  d  &  d &u&    d  d  d &r&    d &W&    d &X&    d &y&    d &P&    d &U&    d &w  d  &  d &R&    d &R&    d &u&    d &r&    d &W&    d &X&    d &y&    d &P&    d &U&    d &w  d  &  d &R&    d &R&    d &u&    d &r&    d &W&    d &X&    d &y&    d &P&    d &U&    d &w  d  &  d &R&    d &R&    d &u&    d  d &d  d  &  d &u&    d  d  d &u&    d &u  d  &  d  d &u  d  &  d &u&    d  d  d &u&    d &u  d  &  d  d &u  d  &  9d d &u&    9  d  d  &n&  &P&  &n&  &n&  &O&  &n&  &n&  &O&  &n&  &Q&  9d &n&  9  &Q&  &n&  &P&  &n&  &n&  &O&  &n&  &n&  &O&  &n&  &Q&  9d &n&  9  &Q&  &n&  &P&  &n&  &n&  &O&  &n&  &n&  &O&  &n&  &Q&  9d &n&  9  &Q&  &n&  &L&  &V&  &n&  &L&  &U&  &n&  &M&  &R&  &n&  &M&  &P&  &n&  &M&  &U&  &n&  &L&  &S&  &n&  &K&  &T&  &n&  &N&  &W&  &n&  &K&  &U&  &n&  &M&  &U&  &n&  &L&  &V&  &n&  &L&  &W&  &n&  &P&  &n&  &n&  &O&  &n&  &n&  &O&  &n&  &Q&  9d &n&  9  &Q&  &n&  &P&  &n&  &n&  &O&  &n&  &n&  &O&  &n&  &Q&  9d &n&  9  &Q&  &n&  &P&  &n&  &n&  &O&  &n&  &n&  &O&  &n&  &Q&  9d &n&  9  &Q&  &n&  &L&  &V&  &n&  &L&  &U&  &n&  &M&  &R&  &n&  &M&  &P&  &n&  &M&  &U&  &n&  &L&  &S&  &n&  &K&  &T&  &n&  &N&  &W&  &n&  &K&  &U&  &n&  &M&  &U&  &n&  &L&  &V&  &n&  &L&  &W&  &n&  &P&  &n&  &n&  &O&  &n&  &n&  &O&  &n&  &Q&  &n&  &Q&  &n&  &P&  &n&  &n&  &O&  &n&  &n&  &O&  &n&  &Q&  &n&  &Q&  &u 9u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& 9  &w& &Q& &R& &y& &Q& &R& &{& &6&  &>&  &G& &;&  &E&  &N&  &W&  &f&  &j&  &u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& &w& &Q& &R& &y& &Q& &R& &{& &6&  &>&  &G& &;&  &E&  &N&  &W&  &f&  &j&  &u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& &w& �Y9d &w&  9 &N& &O& &w 9w9  & &P& &P& &x& &E&  &U&  &^& &P&  &Z&  &c& &Q&  &^&  &i& &?&  &J&  &w& &N& 9d &O&  9 &w& &P& 9d &P&  9 &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  &P&  &Z&  &c&  &o&  9d &w&  9 &N& &O& 9d &w&  9 &P& &P& &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  9d &w&  9 &N& &O& 9d &w&  9 &P& &P& &x& &?&  &L&  &Z& &H&  &R&  &\& &Q&  &^&  &i& &?&  &J&  &u 9u& &P& &P& &y& &P& &P& &y& &O& &z& &Q& &x& &Q& 9  &w& &Q& &R& &y& &Q �a`�& �_�&R�^�& 	�]�&{�\�& �[	�&6�Z
�&  &>�Y�&  &G�X�&  �W�&; �VU�&  &E�T�&  &N
�S�&  &W	�R�&  &f�Q�&  &j�P	�&  &u�O�& �N�&P�M�&  �LK�&P�J�& 
�I�&y
�H�& �G�&P�F�& �E
�&P�D�& �C�&y�BA�& �@�&O�?�& 
�>�&z�=�& �<�&Q�;
�& �:
�&x�9�& �8�&Q �76�& �5�&w�4�& 	�3�&Q�2�& �1	�&R�0
�& �/�&y�.�&  �-�&Q �,+�& �*�&R
�)�& 	�(�&{�'�& �&	�&6�%�&  &>�$�&  &G�#�&  �"!�&;� �&  &E
��&  &N
��&  &W��&  &f��&  &j�
�&  &u��& ��&P��& ��&P��& 
��&y��& ��&P�
�& �
�&P��& ��&y ��& ��&O�
�& 	�	�&z��& �	�&Q�
�& ��&x��&  ��&Q ��& 
�  �/ MTrk  \ �!  �Synth 2 �  �Q �x �
n �d  e  b cGb	 cEb
 cP�r�EsE  HsH FsF CsC EsE @s@ EsE >s>  CsC AsA <s< @s@ ;s; @s@ 9s9  >s> <s< 7s7 :s: 7s7 8s8 9s�$9 <EsE  HsH FsF CsC EsE @s@ EsE >s>  CsC AsA <s< @s@ ;s; @s@ 9s9  >s> <s< 7s7 Es �    $ , 0 8 @�w�E  �/ MTrk  H �!  �Block �   �s �x �
 �n�FdF  �
 �TdT  TdT  �
  �FdF  �
 �TdT  TdT  �
  �FdF  �
 �TdT  TdT  �
  �FdF  �
 �TdT  TdT  �
  �FdF  �
 �TdT  TdT  �
  �FdF �vFdF  �
 �TdT  TdT  �
  �FdF  �
 �TdT  TdT  �
  �FdF  �
 �TdT  TdT  �
  �FdF  �
 �TdT  TdT  �
  �FdF  �
 �TdT  TdT  �
  �FdF  �/ {   ���i�GY    i    DDMIa   d  �   wendigo @   BJ  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?V  static @���B�   �?^HY    p    DDMIh   d  L  ���   i   Sing2 @   BJ  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?  �?W  static @���B�   \����HY    �    DDMI�   d  N   blank @   BX   blank @   BY   eyes @   �BBX   blank @   BY   short @   �BBY   none @   �BB\  ����HY    J   �PNG

   IHDR   @   @   ����   �PLTELiq��  G QF r6hiBBB<<<�����A��}   �ʕ��x�Ǝ��g��H�n ��~pahhh)))`SIII F nnnHF 1\+***OOOj0 =_+Bx8:::SSSjjj������"5.*$!???݊.�[	   tRNS @��f   ezTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%�����3�(17�6�RVp�s� ��9�aD  �IDATX���N�0�=� �Nk�b�MY.����8�������&��_i�_D��$�$��Ұ��$@��A�'p��:�a	��x�C
�S�������-r\�l2U�i&C�|2�'���z���C�����C��	�y>r�X�����Wt\�U�_-
��7�h��mO�q��%�A(K���ܥ` �D8����+�vE+��(.\�tn��s�ԍ��rTE�[�,���i��{�_��׽Kd8	��KkkK��7�s�M���??=>� �IAǪ��{4�������]b�{�n��A��`��	WW�opQ0���l�+4`��&��_�#0�;�`� �6h�-��hZ�6�w�1�`+Zl^��+8.��ڭ���h�Q�|���]>P�.Վ�H��RQ�B|�)����kRd2�dF����
�ϳ?�c>8�O����0�������^�|��;�\>8����������A���%�z������Z    IEND�B`�.   ,�/	JY        DDMI   �  portgen2 @  ��  �$	JY    n   �PNG

   IHDR           szz�   izTXtDescription  x�%ǽ
� ����G�K(�� h�P�J�~��9�ލ����Xj~nH��H�ˡ%H,3��ZOm�EHpN,�R!1;��b��v
�����rFB  �IDATX��_LSg���zRkKKa�I�J���gYM�I�Ø�:�,���ՔdY��W۝�sB2M`f�1�x�p�e�#����&���V�B�㷋����_������|�����_ϑ�M�<��y��/,���Z�<Z[� ��Լ�iI�%���{.7yb?��h�$�����M��Ӏk�a��뵌ܹ��=��n�osa��oM��/��*왚p)p��w:t�L���*O*����j]����P@ٹHt����OBD/�엶j�5��<K���<`)���I�
%��k/4w�_���ʑA`�ڵٓ;;���s���/r���\��~�L_{����6��D_xFJ������mv����S�����e͚������M�֯���k/y��n�4r��Tu}�������:V䭠�TI^^v��]�v����U#�%��m���{(r���Jd)p��Q�^/ 6��8q�V+eee�l6"�x�^~���)1T$f0�'k\w'�F�(�B��8��X��8�F#&����0��>7+��GfD�|��&<y�$eee�B!��( k��1 ��� �n��K��׻!*��K\��;C͚ÄC��YH���.���� �_�F$2ˉ'�?~�Hd�ǃ�(W��^v{%I4w��|W��Z���A@J����\�R�KJJ(�VN��|F�
4-Q���0����2X��T	����[�~130���jp��z�-�<`.4`�Z���gdd��b��f3�!���p�(
����Z�twwPSS�'������7��e�H�P@�Ǆ�����ӘL&,r�����ޟ����E���ġ�!���X]��67/��n��0�Wg m=�"��6��/Y������<%�&&&�{�.N����q�N'v����ib�X��dw��_Y�8xlU���S$�L�ih�4MC�4rr�ccc ����(
��r��6��'k�K7�K���%UUI;Ϝ���jTU%<C�٩Y
^) x���!�2c�c������'c	�P�7I�����_������u"2�JJ��� ���q��<�|�Jd)��
FC	Xrk�:�H�tǤ�_F��nQ^[�,T�I�����9�BF�4 ��^ŵ~K���@�@��/���$�+=V�Vb4�{�j�a]%��a�.H��qc)�����4�_�F��$�:^    IEND�B`�6   ?x@�<JY    $    DDMI   �   seeds-ovl @���� ��B e  ���pqJY    S   �PNG

   IHDR           D���   ~PLTELiq��  G QF r6hiBBB<<<���   �n pahhh)))`SIII F nnnHF 1\+***OOOj0 =_+Bx8:::SSSjjj������"5.*$!???q-`   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C  IDAT8����n� E1���M��94����d����h���dڮ����~
Ԫ�F����
�.6&ke$�-\0���?�]����E8�H�9�*اb���se/d[��	���$g9uE�h��K %k�0r�r{c`j��A�6�G/I֍���߆o29H�[����	�٥� 9�/׏��|*9�|���>�g�a�♛�xF�%��(i=A[��TץW**�K9�J���W ����}��9FԀ�@�YC�җ5��M7�h$��    IEND�B`�M  �ؓ��JY    ;   �PNG

   IHDR   @   @   ����   `PLTELiq��A�ʕ�Ǝ3� ��w��}��x��g��H��~��r��Ď����6����h��\�F:::SSSjjj�������`�X��j��i݊.�9��V��	l   tRNS @��f   ezTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%�����3�(17�6�RVp�s� ��9�aD  IDATX�ݗ�r�0�#�s��@K!��߲��3��t�/30��y�#U�n��^әE<���E���<��K��h\����ڦ�B�������/�����An
��9/|]&H��@�"�+W��\D�HC������K E^���H9�F�F ��� �(�A���o��6���J~��[0]�-�F�X|���<�)�d��j� �r �] ������ �|�j���������pzп3�43�A�gv+�9�i���m7�{]�
Ep\I�Gsq���g�
����3��� ��rIg�'��r1]>�����w�mZ)��q@鉇���sZbD0@���I( �K�8�G��y�����$� �7 �0� h�Tpj����i��B�D����2 h1z �$:Kx$�ࠐv� 'p* H	�t����cY v��y�O׳�����{}�9 5Y�ʒ���7�h\�S�}$@����ݎc�G�aj}W�G"S�TL�e��sp���z��8^!� ���<�n�]��    IEND�B`��   .��
�JY    �    �PNG

   IHDR           �Tg�   PLTELiq:::SSSjjj������i�   tRNS @��f   dzTXtDescription  x�SVpru��Sp���*K-*���S�U0�3��,�L)� r���83R3�3J ��ĒT SI��3%���4��L+J�M���\�\�& ��}��C   IDAT(�c`��ʮΊ�� �� Ι�n�    IEND�B`�