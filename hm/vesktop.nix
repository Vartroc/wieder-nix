{ config, lib, ... }:
{
  options.custom.vesktop.enable = lib.mkEnableOption "Vesktop Theme";
  config = lib.mkIf config.custom.vesktop.enable {
    home.file."/home/andi/.config/vesktop/themes/catppuccin-macchiato.theme.css" = {
      text = ''
        /**
         * @name system24 (catppuccin macchiato lavender)
         * @description A tui-style discord theme. Based on the catppuccin maccchiato color palette.
         * @author refact0r, bean
         * @version 1.0.0
         * @invite nz87hXyvcy
         * @website https://github.com/refact0r/system24
         * @source https://github.com/refact0r/system24/blob/master/flavors/catppuccin-mocha.theme.css 
         * @authorId 508863359777505290
         * @authorLink https://www.refact0r.dev
        */

        /* import theme modules */
        @import url('https://refact0r.github.io/system24/src/main.css'); /* main theme css. DO NOT REMOVE */
        @import url('https://refact0r.github.io/system24/src/unrounding.css'); /* gets rid of all rounded corners. remove if you want rounded corners. */

        /* customize things here */
        :root {
        	--font: '${config.stylix.fonts.sansSerif.name}'; /* UI font name. it must be installed on your system. */
        	letter-spacing: -0.05ch; /* decreases letter spacing for better readability. */
        	font-weight: 300; /* UI font weight. */
        	--label-font-weight: 500; /* font weight for panel labels. */
        	--corner-text: 'macchiato24'; /* custom text to display in the corner. only works on windows. */
        	--pad: 16px; /* padding between panels. */
        	--txt-pad: 10px; /* padding inside panels to prevent labels from clipping */
        	--panel-roundness: 0px; /* corner roundness of panels. ONLY WORKS IF unrounding.css IS REMOVED (see above). */

        	/* background colors */
        	--bg-0: rgba(36, 39, 58, 0.95); /* main background color. */
        	--bg-1: rgba(30, 32, 48, 0.95); /* background color for secondary elements like code blocks, embeds, etc. */
        	--bg-2: rgba(54, 58, 79, 0.95); /* color of neutral buttons. */
        	--bg-3: rgba(73, 77, 100, 0.95); /* color of neutral buttons when hovered. */

        	/* state modifiers */
        	--hover: color-mix(in oklch, var(--txt-3), transparent 80%); /* color of hovered elements. */
        	--active: color-mix(in oklch, var(--txt-3), transparent 60%); /* color of elements when clicked. */
        	--selected: var(--active); /* color of selected elements. */

        	/* text colors */
        	--txt-dark: var(--bg-0); /* color of dark text on colored backgrounds. */
        	--txt-link: var(--cyan); /* color of links. */
        	--txt-0: #eaeefa; /* color of bright/white text. */
        	--txt-1: #cad3f5; /* main text color. */
        	--txt-2: #939ab7; /* color of secondary text like channel list. */
        	--txt-3: #5b6078; /* color of muted text. */

        	/* accent colors */
        	--acc-0: var(--lavender); /* main accent color. */
        	--acc-1: var(--lavender-1); /* color of accent buttons when hovered. */
        	--acc-2: var(--lavender-2); /* color of accent buttons when clicked. */

        	/* borders */
        	--border-width: 2px; /* panel border thickness. */
        	--border-color: var(--bg-2); /* panel border color. */
        	--border-hover-color: var(--acc-0); /* panel border color when hovered. */
        	--border-transition: 0.2s ease; /* panel border transition. */

        	/* status dot colors */
        	--online-dot: var(--cyan); /* color of online dot. */
        	--dnd-dot: var(--pink); /* color of do not disturb dot. */
        	--idle-dot: var(--yellow); /* color of idle dot. */
        	--streaming-dot: var(--purple); /* color of streaming dot. */

        	/* mention/ping and message colors */
        	--mention-txt: var(--acc-0); /* color of mention text. */
        	--mention-bg: color-mix(in oklch, var(--acc-0), transparent 90%); /* background highlight of mention text. */
        	--mention-overlay: color-mix(in oklch, var(--acc-0), transparent 90%); /* overlay color of messages that mention you. */
        	--mention-hover-overlay: color-mix(in oklch, var(--acc-0), transparent 95%); /* overlay color of messages that mention you when hovered. */
        	--reply-overlay: var(--active); /* overlay color of message you are replying to. */
        	--reply-hover-overlay: var(--hover); /* overlay color of message you are replying to when hovered. */

        	/* color shades */
        	--pink: oklch(73.7% 0.125 11.19);
        	--pink-1: oklch(63.7% 0.125 11.19);
        	--pink-2: oklch(53.7% 0.125 11.19);
        	--purple: oklch(77.15% 0.126 303.9);
        	--purple-1: oklch(67.15% 0.126 303.9);
        	--purple-2: oklch(57.15% 0.126 303.9);
        	--cyan: oklch(78.51% 0.085 228.38);
        	--yellow: oklch(87.9% 0.074 84.75);
        	--green: oklch(83.5% 0.108 138.15);
        	--green-1: oklch(73.5% 0.108 138.15);
        	--green-2: oklch(63.5% 0.108 138.15);
        	--lavender: oklch(81.66% 0.091 277.31);
        	--lavender-1: oklch(71.66% 0.091 277.31);
        	--lavender-2: oklch(61.66% 0.091 277.31);
        }


      '';
      target = ".config/vesktop/themes/catppuccin-macchiato.theme.css";
      force = true;
      enable = true;
    };
  };
}
