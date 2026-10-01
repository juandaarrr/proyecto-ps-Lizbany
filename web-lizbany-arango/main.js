/* main.js — Ps. Lizbany Arango site entry point (IIFE, no modules) */
(function () {
  "use strict";

  var $ = function (sel, scope) { return (scope || document).querySelector(sel); };
  var $$ = function (sel, scope) { return Array.prototype.slice.call((scope || document).querySelectorAll(sel)); };
  var reduced = matchMedia("(prefers-reduced-motion: reduce)").matches;

  function safe(fn, name) {
    try { fn(); } catch (e) { console.warn("[" + name + "]", e); }
  }

  /* --- nav: solidify on scroll --- */
  function initNav() {
    var nav = $("[data-nav]");
    if (!nav) return;
    var onScroll = function () {
      if (window.scrollY > 12) nav.classList.add("is-scrolled");
      else nav.classList.remove("is-scrolled");
    };
    window.addEventListener("scroll", onScroll, { passive: true });
    onScroll();
  }

  /* --- smooth anchor scroll (native, offset for sticky nav) --- */
  function initAnchors() {
    document.addEventListener("click", function (e) {
      var a = e.target.closest ? e.target.closest('a[href^="#"]') : null;
      if (!a) return;
      var id = a.getAttribute("href");
      if (!id || id === "#") return;
      var el = document.querySelector(id);
      if (!el) return;
      e.preventDefault();
      var navOffset = 84;
      var top = el.getBoundingClientRect().top + window.scrollY - navOffset;
      window.scrollTo({ top: top, behavior: reduced ? "auto" : "smooth" });
    });
  }

  /* --- scroll reveal: threshold low + 6s safety net (gotcha A.8) ---
     Elements are only ever hidden once JS "arms" them here. If this
     function never runs (earlier init throws, IntersectionObserver is
     unsupported, anything), content simply stays visible (CSS default). */
  function initReveals() {
    var targets = $$(".reveal");
    if (!targets.length) return;
    if (!("IntersectionObserver" in window)) return; // leave visible, no enhancement

    targets.forEach(function (el) { el.classList.add("reveal-armed"); });

    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          io.unobserve(entry.target);
        }
      });
    }, { threshold: 0.01, rootMargin: "0px 0px -2% 0px" });

    targets.forEach(function (el) { io.observe(el); });

    setTimeout(function () {
      $$(".reveal:not(.is-visible)").forEach(function (el) {
        if (el.getBoundingClientRect().top < window.innerHeight) {
          el.classList.add("is-visible");
        }
      });
    }, 6000);

    // hero reveals immediately, above the fold — don't wait on scroll intent
    $$(".hero .reveal").forEach(function (el) {
      requestAnimationFrame(function () {
        setTimeout(function () { el.classList.add("is-visible"); }, 80);
      });
    });
  }

  /* --- botanical line parallax: subtle, functional-scale (<=24px), not gated --- */
  function initParallax() {
    var lines = $$(".botanical-line");
    if (!lines.length) return;
    var ticking = false;
    var update = function () {
      var y = window.scrollY;
      lines.forEach(function (el, i) {
        var speed = i % 2 === 0 ? 0.04 : -0.05;
        var shift = Math.max(-24, Math.min(24, y * speed));
        el.style.transform = "translate3d(0," + shift + "px,0)";
      });
      ticking = false;
    };
    window.addEventListener("scroll", function () {
      if (!ticking) {
        requestAnimationFrame(update);
        ticking = true;
      }
    }, { passive: true });
    update();
  }

  function boot() {
    safe(initNav, "initNav");
    safe(initAnchors, "initAnchors");
    safe(initReveals, "initReveals");
    safe(initParallax, "initParallax");

    if (window.gsap && window.ScrollTrigger) {
      try { gsap.registerPlugin(ScrollTrigger); } catch (e) { /* noop */ }
    }

    document.documentElement.classList.add("is-ready");
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", boot);
  } else {
    boot();
  }
})();
