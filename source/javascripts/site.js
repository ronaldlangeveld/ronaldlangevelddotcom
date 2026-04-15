// Navbar dropdown: click to toggle, outside-click / Escape to close.
// Works on desktop and mobile (Bulma's :hover alone is unreliable on touch).
document.addEventListener('DOMContentLoaded', () => {
  const dropdowns = document.querySelectorAll('[data-dropdown]');
  if (!dropdowns.length) return;

  const closeAll = () => {
    dropdowns.forEach((dropdown) => {
      dropdown.classList.remove('is-active');
      const trigger = dropdown.querySelector('.navbar-link');
      if (trigger) trigger.setAttribute('aria-expanded', 'false');
    });
  };

  dropdowns.forEach((dropdown) => {
    const trigger = dropdown.querySelector('.navbar-link');
    if (!trigger) return;

    trigger.addEventListener('click', (event) => {
      event.preventDefault();
      event.stopPropagation();
      const willBeActive = !dropdown.classList.contains('is-active');
      closeAll();
      if (willBeActive) {
        dropdown.classList.add('is-active');
        trigger.setAttribute('aria-expanded', 'true');
      }
    });
  });

  document.addEventListener('click', (event) => {
    const clickedInsideADropdown = Array.from(dropdowns).some((d) => d.contains(event.target));
    if (!clickedInsideADropdown) closeAll();
  });

  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') closeAll();
  });
});
